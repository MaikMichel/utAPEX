prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'TAYRA_APP')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'utPLSQL Testing App')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'120')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'EBE001EF7E21A6BCD258E2CFD20301448A61D123EEF0246EF24B6D78EAE6D3C9'
,p_bookmark_checksum_function=>'SH512'
,p_accept_old_checksums=>false
,p_compatibility_mode=>'19.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DD-MON-YYYY'
,p_date_time_format=>'DD-MON-YYYY'
,p_timestamp_format=>'DD-MON-YYYY HH24:MI:SS'
,p_timestamp_tz_format=>'DD-MON-YYYY'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2018.09.07.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(52100336434767934)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'utPLSQL Testing App Built with APEX'
,p_app_builder_icon_name=>'app-icon.svg'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_friendly_url=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'utPLSQL Testing App'
,p_substitution_string_02=>'OWNER'
,p_substitution_value_02=>'&APP_SCHEMA.'
,p_substitution_string_03=>'TEST_SCHEMA'
,p_substitution_value_03=>'ut3'
,p_last_updated_by=>'MMI'
,p_last_upd_yyyymmddhh24miss=>'20210226180842'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>4
,p_ui_type_name => null
,p_print_server_type=>'INSTANCE'
);
end;
/
