prompt --application/shared_components/logic/application_processes/app_schema
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(33573912237373442)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'App_schema'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_app_schema varchar2(30);',
'begin',
'select sys_context( ''userenv'', ''current_schema'' ) into l_app_schema from dual;',
':APP_SCHEMA:=l_app_schema;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'ALWAYS'
);
end;
/
