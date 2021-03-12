prompt --application/shared_components/security/authentications/db_accounts
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(34500107562265015)
,p_name=>'DB Accounts'
,p_scheme_type=>'NATIVE_DB_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
