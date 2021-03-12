prompt --application/shared_components/user_interface/lovs/suite_path_list
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(36956422081402499)
,p_lov_name=>'SUITE PATH LIST'
,p_lov_query=>'select path d, path r from table(ut_runner.get_suites_info(NVL(:P17_OWNER,''NOBODY''))) where item_type = ''UT_LOGICAL_SUITE'' order by path'
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
end;
/
