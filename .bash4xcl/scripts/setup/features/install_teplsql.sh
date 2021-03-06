#!/bin/bash

source ../../../.bash4xcl/lib.sh

# target environment
source ../../../build.env
source ../../../apply.env

# ------------------------------------------------------------------- #
echo " ============================================================================="
echo " ==   Installing osalvador/tePLSQL: MaikMichel/tePLSQL"
echo " ============================================================================="
echo
yes=${1:-"NO"}
DB_PASSWORD=${2:-$DB_PASSWORD}

teplsql_schema="teplsql"
teplsql_pass=$(shuf -zer -n20 {A..Z} {a..z} {0..9} | tr -d '\0')
teplsql_tspace="users"

tag_name=$(curl --silent "https://api.github.com/repos/MaikMichel/tePLSQL/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
curl -OL "https://github.com/MaikMichel/tePLSQL/archive/${tag_name}.zip"

unzip ${tag_name}.zip -d "tePLSQL-${tag_name}"
rm ${tag_name}.zip

cd "tePLSQL-"${tag_name}/tePLSQL-${tag_name/v/} # remove v from tag-name

if [ -z "$DB_ADMINUSER" ]
then
  read -p "Enter username of admin user (admin, sys, ...) [sys]: " DB_ADMINUSER
  DB_ADMINUSER=${DB_ADMINUSER:-"sys"}
fi

if [[ ${DB_ADMINUSER,,} != "sys" ]]; then
  DBA_OPTION=""
  teplsql_tspace="data" # no users tablespace when using autonomous db
fi

if [ -z "$DB_PASSWORD" ]
then
  ask4pwd "Enter password für user ${DB_ADMINUSER}: "
  DB_PASSWORD=${pass}
fi


is_teplsql_installed () {
    sqlplus -s ${DB_ADMINUSER}/${DB_PASSWORD}@${DB_TNS}${DBA_OPTION} <<!
    set heading off
    set feedback off
    set pages 0
    with checksql as (select count(1) cnt
  from all_users
 where username = upper('${teplsql_schema}'))
 select case when cnt = 1 then 'true' else 'false' end ding
   from checksql;
!
}

TEPLSQL_INSTALLED=$(is_teplsql_installed)
if [ "${TEPLSQL_INSTALLED}" == "true" ]
then
  if [ $yes == "YES" ]; then
    reinstall="Y"
  else
    read -p "$(echo -e ${BWHITE}"TEPLSQL is allready installed. Would you like to reinstall? (Y/N) [Y]: "${NC})" reinstall
    reinstall=${reinstall:-"Y"}
  fi

  if [ ${reinstall,,} == "y" ]; then
    sqlplus -s ${DB_ADMINUSER}/${DB_PASSWORD}@${DB_TNS}${DBA_OPTION} <<!
  Prompt ${teplsql_schema} droppen
  drop user ${teplsql_schema} cascade;
!
  else
    cd ../..
    rm -rf "tePLSQL-"${tag_name}
    exit
  fi
fi

sqlplus -s ${DB_ADMINUSER}/${DB_PASSWORD}@${DB_TNS}${DBA_OPTION} <<!
Prompt create user: ${teplsql_schema}
create user ${teplsql_schema} identified by "${teplsql_pass}" default tablespace ${teplsql_tspace} temporary tablespace temp
/
alter user ${teplsql_schema} quota unlimited on ${teplsql_tspace}
/
grant connect, create view, create job, create table, create sequence, create trigger, create procedure, create public synonym to ${teplsql_schema}
/

conn ${teplsql_schema}/${teplsql_pass}@$DB_TNS

Prompt installing tePLSQL

@@install.sql

Prompt create public synonyms
create or replace public synonym TE_TEMPLATES for ${teplsql_schema}.TE_TEMPLATES;
create or replace public synonym teplsql for ${teplsql_schema}.teplsql;
create or replace public synonym te_templates_api for ${teplsql_schema}.te_templates_api;

Prompt grant public synonyms
grant select, insert, delete, update on TE_TEMPLATES to public;
grant execute on teplsql to public;
grant execute on te_templates_api to public;

Promp lock user: ${teplsql_schema}
conn ${DB_ADMINUSER}/${DB_PASSWORD}@${DB_TNS}${DBA_OPTION}
alter user ${teplsql_schema} account lock;

Promp tePLSQL installed

!

cd ../..
rm -rf "tePLSQL-"${tag_name}

exit