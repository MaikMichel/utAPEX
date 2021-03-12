prompt --application/shared_components/security/authentications/no_auth
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(52100336434767934)
,p_name=>'No Auth'
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
