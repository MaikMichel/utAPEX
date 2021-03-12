prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(40588583284079506)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(41151228793325820)
,p_list_item_display_sequence=>11
,p_list_item_link_text=>'Overview'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-dashboard'
,p_security_scheme=>wwv_flow_api.id(40711335611080246)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(44352778998794403)
,p_list_item_display_sequence=>12
,p_list_item_link_text=>'Start Testing'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:17:::'
,p_list_item_icon=>'fa-rocket'
,p_security_scheme=>wwv_flow_api.id(40711335611080246)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33306074665001974)
,p_list_item_display_sequence=>31
,p_list_item_link_text=>'Required Treatment'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-ambulance'
,p_list_item_disp_cond_type=>'NEVER'
,p_security_scheme=>wwv_flow_api.id(40711335611080246)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'10'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(37193628449897617)
,p_list_item_display_sequence=>131
,p_list_item_link_text=>'Test Report Graphical View'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:::'
,p_list_item_icon=>'fa-line-chart'
,p_security_scheme=>wwv_flow_api.id(40711335611080246)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
end;
/
