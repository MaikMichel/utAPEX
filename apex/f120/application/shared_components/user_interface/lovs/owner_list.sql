prompt --application/shared_components/user_interface/lovs/owner_list
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(36956206667393700)
,p_lov_name=>'OWNER LIST'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct username d,username r from all_users where Oracle_Maintained =''N'' and username not in (''APEX_LISTENER'', ''APEX_REST_PUBLIC_USER'')order by username',
''))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
end;
/
