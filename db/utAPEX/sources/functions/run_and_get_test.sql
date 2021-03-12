  CREATE OR REPLACE EDITIONABLE FUNCTION run_and_get_test (p_pkg_name  in      varchar2 default null,
                                            p_prc_name  in      varchar2 default null,
                                            p_suitepath in      varchar2 default null)
                                            return blob is
  type t_array is table of varchar2(4000) index by binary_integer;

  l_test_run_result_xml clob;
  l_test_result         t_array; --t_varchar2_tab;
  l_pkg_name            varchar2(32000 char);

  v_dest_offset         integer := 1;
  v_source_offset       integer := 1;
  v_blob                blob;
  v_lang_context        integer := DBMS_LOB.DEFAULT_LANG_CTX;
  v_warning             integer := DBMS_LOB.WARN_INCONVERTIBLE_CHAR;

  function tab_to_string (p_array         in      t_array,
                          p_delimiter     in      varchar2 default ',')
                          return clob is
    l_string     clob;
  begin
    for i in p_array.first .. p_array.last
    loop
      if i != p_array.first then
        l_string := l_string || p_delimiter;
      end if;
      l_string := l_string || p_array(i);
    end loop;
    return l_string;
  end tab_to_string;
begin
  if p_prc_name is null then
    if p_suitepath is not null then
      select * bulk collect
        into l_test_result
        from table(ut.run(ut_varchar2_list(p_pkg_name||':'||p_suitepath), ut_junit_reporter()));
    else
      l_pkg_name := replace(p_pkg_name,':',',');
      select * bulk collect
        into l_test_result
        from table(ut.run(ut_varchar2_list(l_pkg_name),ut_junit_reporter()));
    end if;
  else
    l_pkg_name := replace(p_prc_name,':',',');
    select * bulk collect
      into l_test_result
      from table(ut.run(ut_varchar2_list(l_pkg_name),ut_junit_reporter()));
  end if;

  l_test_run_result_xml := trim(replace(tab_to_string(l_test_result,''),'<?xml version="1.0"?>',''));

  -- convert clob2blob
  dbms_lob.createtemporary(v_blob, true, DBMS_LOB.CALL);
  dbms_lob.converttoblob (
          dest_lob    => v_blob,
          src_clob    => l_test_run_result_xml,
          amount      => DBMS_LOB.LOBMAXSIZE,
          dest_offset => v_dest_offset,
          src_offset  => v_source_offset,
          blob_csid   => DBMS_LOB.DEFAULT_CSID,
          lang_context=> v_lang_context,
          warning     => v_warning
      );


  return v_blob;
end;
/