prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(40708662826080105)
,p_name=>'Test Details '
,p_page_mode=>'MODAL'
,p_step_title=>'Test Details'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(40591960630079708)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40711335611080246)
,p_dialog_height=>'300'
,p_dialog_width=>'900'
,p_dialog_chained=>'N'
,p_last_updated_by=>'SAMBATI'
,p_last_upd_yyyymmddhh24miss=>'20191120171359'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(41050579333229903)
,p_name=>'Test Details '
,p_template=>wwv_flow_api.id(40633550797079838)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Testcase_name  as "Test case name",',
'     TESTCASE_PATH "Test case path", ',
'     DURATION_SEC "Test run duration",',
'       case ',
'           when TEST_STATUS in (''Error'') then  ''Error message:  ''||nvl(ERROR_STATEMENT,'' No Error Messages has been Captured '')||'', System Error:  ''|| SYSTEM_ERR||'', System Out: ''||SYSTEM_OUT',
'           when TEST_STATUS in (''Failure'') then  '' Failure message:  ''||',
'           nvl(FAILURE_STATEMENT,'' No Failure messages has been Captured '')||'', System Error:  ''|| nvl(SYSTEM_ERR, '' No error was found '')||'', System Out: ''||nvl(SYSTEM_OUT,'' Nothing to display '')',
'           else',
'           ''Success''',
'       end  as  Test_output',
'       ,',
'       case ',
'           when TEST_STATUS in (''Failure'')  then ''orange''',
'            when TEST_STATUS in (''Error'')  then ''red''',
'           else                                   ''green'' ',
'       end  as "STATUS_COLOR"',
'  from uta_test_case  where id=:P7_ID',
''))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(40651795064079894)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(22660020850657144)
,p_query_column_id=>1
,p_column_alias=>'Test case name'
,p_column_display_sequence=>2
,p_column_heading=>'Test Case Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(22660063660657145)
,p_query_column_id=>2
,p_column_alias=>'Test case path'
,p_column_display_sequence=>1
,p_column_heading=>'Test Case Path'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(22660234611657146)
,p_query_column_id=>3
,p_column_alias=>'Test run duration'
,p_column_display_sequence=>3
,p_column_heading=>'Test Duration'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(22660314251657147)
,p_query_column_id=>4
,p_column_alias=>'TEST_OUTPUT'
,p_column_display_sequence=>4
,p_column_heading=>'Test Result'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span style="color:#STATUS_COLOR#;font-weight:bold;">#TEST_OUTPUT#</span>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(22660361084657148)
,p_query_column_id=>5
,p_column_alias=>'STATUS_COLOR'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(36687215038018979)
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_ID:&P7_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24720376772683302)
,p_name=>'P7_EXECUTED_ON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(41050579333229903)
,p_source=>'P7_EXECUTED_ON'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41231907032837727)
,p_name=>'P7_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41050579333229903)
,p_use_cache_before_default=>'NO'
,p_source=>'SELECT id FROM UTA_TEST_CASE ORDER BY ID desc FETCH  first  ROW only'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
