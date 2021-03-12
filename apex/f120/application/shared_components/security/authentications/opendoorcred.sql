prompt --application/shared_components/security/authentications/opendoorcred
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(34574642392703810)
,p_name=>'OpenDoorCred'
,p_scheme_type=>'NATIVE_OPEN_DOOR'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
