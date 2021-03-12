prompt --application/shared_components/user_interface/lovs/test_cases_list
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(36912466569754117)
,p_lov_name=>'TEST CASES LIST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name||''.''||ITEM_NAME d, :P17_OWNER||''.''||object_name||''.''||ITEM_NAME r from table(ut_runner.get_suites_info(:P17_OWNER))',
'where item_type = ''UT_TEST'' and object_name in (select  ',
'                                column_value  ',
'                            from  ',
'                                table(apex_string.split(replace(:P17_PACKAGE_NAMES,:P17_OWNER||''.'',''''), '':''))) order by object_name',
''))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
end;
/
