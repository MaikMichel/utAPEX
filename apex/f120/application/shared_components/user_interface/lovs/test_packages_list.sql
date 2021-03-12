prompt --application/shared_components/user_interface/lovs/test_packages_list
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(36518899805747871)
,p_lov_name=>'TEST PACKAGES LIST'
,p_lov_query=>'select OBJECT_NAME d, :P17_OWNER||''.''||OBJECT_NAME r from table(ut_runner.get_suites_info(NVL(:P17_OWNER, ''NO''))) where item_type = ''UT_SUITE'' and Path like nvl(:P17_DIR_PATH||''%'',path) order by object_name'
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
end;
/
