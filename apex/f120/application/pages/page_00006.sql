prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(40708662826080105)
,p_name=>'Test Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Test Details'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40711335611080246)
,p_dialog_height=>'600'
,p_dialog_width=>'800'
,p_dialog_chained=>'N'
,p_last_updated_by=>'MBECKER'
,p_last_upd_yyyymmddhh24miss=>'20191120180904'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71760052639811733)
,p_plug_name=>'Test Suite Results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40633550797079838)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select testcase_name "Testcase Name",',
'       nvl(test_status,''Success'') test_status,',
'      case when test_status in ( ''Error'') then ''red''',
'          when test_status in (''Failure'') then ''orange'' else ''green'' ',
'      end "STATUS_COLOR", ',
'      duration_sec "Test Duration", ',
'     case when error_statement is null ',
'     then nvl(Failure_statement,''Test was successful'')',
'      else error_statement ',
'     end "Error or Failure Info",',
'   System_err "System Error", ',
'   System_out "system Output",',
'   testcase_path',
'from UTA_TEST_CASE ',
'where UTA_TEST_SUITE_ID ',
' in (select id from uta_test_suite where uta_test_run_id = :P6_TEST_RUN_ID and package_path like :P6_PKGPATH||''%'')',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P6_HIDE'
,p_plug_display_when_cond2=>'1'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(71950313511904787)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>71950313511904787
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24750730379816582)
,p_db_column_name=>'Testcase Name'
,p_display_order=>10
,p_column_identifier=>'R'
,p_column_label=>'Testcase Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24749198675816581)
,p_db_column_name=>'Test Duration'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>'Test Duration'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24749579420816581)
,p_db_column_name=>'Error or Failure Info'
,p_display_order=>40
,p_column_identifier=>'O'
,p_column_label=>'Error Or Failure Info'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24749968211816582)
,p_db_column_name=>'System Error'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'System Error'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24750360020816582)
,p_db_column_name=>'system Output'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>'System Output'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24751160844816582)
,p_db_column_name=>'TEST_STATUS'
,p_display_order=>90
,p_column_identifier=>'V'
,p_column_label=>'Test Status'
,p_column_html_expression=>'<span style="color:#STATUS_COLOR#;font-weight:bold;">#TEST_STATUS#</span>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24751593328816583)
,p_db_column_name=>'STATUS_COLOR'
,p_display_order=>100
,p_column_identifier=>'W'
,p_column_label=>'Status Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22299580037372038)
,p_db_column_name=>'TESTCASE_PATH'
,p_display_order=>110
,p_column_identifier=>'X'
,p_column_label=>'Testcase Path'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(71962448917994648)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'247519'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Testcase Name:TESTCASE_PATH:Error or Failure Info:TEST_STATUS:Test Duration:'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(86176969781635495)
,p_name=>'Test Run Pkg Stats   '
,p_template=>wwv_flow_api.id(40634728512079847)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--slimPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--medium:t-BadgeList--circular:t-BadgeList--fixed'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select testsuite_name ,uta_test_run_id, sum(TOTAL_TESTS) total, sum(FAILED_TESTS) FAILED,  sum (to_number(TOTAL_TESTS)-( to_number(FAILED_TESTS)+to_number(ERRORED_TESTS)) )',
'        SUCCESSED, sum(ERRORED_TESTS) ERRORED',
'         from uta_test_suite where package_path =:P6_PKGPATH and uta_test_run_id = :P6_TEST_RUN_ID group by uta_test_run_id, testsuite_name',
'      '))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P6_ID'
,p_query_row_template=>wwv_flow_api.id(40653553171079896)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24752698065816593)
,p_query_column_id=>1
,p_column_alias=>'TESTSUITE_NAME'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24753025624816594)
,p_query_column_id=>2
,p_column_alias=>'UTA_TEST_RUN_ID'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24753461287816594)
,p_query_column_id=>3
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>1
,p_column_heading=>'Total Testcases'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<div style="background-color:darkblue; ">#TOTAL#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24753868090816594)
,p_query_column_id=>4
,p_column_alias=>'FAILED'
,p_column_display_sequence=>3
,p_column_heading=>'Fail'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<div style="background-color:#FF8000; ">#FAILED#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24754256160816595)
,p_query_column_id=>5
,p_column_alias=>'SUCCESSED'
,p_column_display_sequence=>2
,p_column_heading=>'Success'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<div style="background-color:#088A4B; ">#SUCCESSED#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24754681333816595)
,p_query_column_id=>6
,p_column_alias=>'ERRORED'
,p_column_display_sequence=>4
,p_column_heading=>'Error'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<div style="background-color:#DF0101; ">#ERRORED#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90670221189118328)
,p_plug_name=>'Test Details '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40633550797079838)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,testcase_path "Testcase Path",testcase_name,nvl(test_status,''Success'') status, ',
'case when test_status in ''Error'' then ''red'' ',
'     when test_status in ''Failure'' then ''orange'' else ''green'' end "STATUS_COLOR",''Detail'' "Detail",',
'''History'' "History"  from UTA_TEST_CASE where UTA_TEST_SUITE_ID in (select id from uta_test_suite where uta_test_run_id = :P6_TEST_RUN_ID and package_path like :P6_PKGPATH||''%'')',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P6_HIDE'
,p_plug_display_when_cond2=>'1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(90670339914118328)
,p_name=>'Test Details'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'TESTER'
,p_internal_uid=>90670339914118328
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24757773856816598)
,p_db_column_name=>'TESTCASE_NAME'
,p_display_order=>30
,p_column_identifier=>'O'
,p_column_label=>'Testcase '
,p_allow_highlighting=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24758110019816598)
,p_db_column_name=>'STATUS'
,p_display_order=>40
,p_column_identifier=>'P'
,p_column_label=>'Status'
,p_column_html_expression=>'<span style="color:#STATUS_COLOR#;font-weight:bold;">#STATUS#</span>'
,p_allow_sorting=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24758581027816599)
,p_db_column_name=>'ID'
,p_display_order=>70
,p_column_identifier=>'S'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24756151641816597)
,p_db_column_name=>'STATUS_COLOR'
,p_display_order=>80
,p_column_identifier=>'U'
,p_column_label=>'Status Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24756536705816597)
,p_db_column_name=>'Testcase Path'
,p_display_order=>90
,p_column_identifier=>'V'
,p_column_label=>'Testcase Path'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24756974712816598)
,p_db_column_name=>'Detail'
,p_display_order=>100
,p_column_identifier=>'W'
,p_column_label=>'<p style="color:#337ac0;" >Detail </p>'
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_ID:#ID#'
,p_column_linktext=>'<span aria-hidden="true" style="color:Blue" class="fa fa-binoculars"></span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24757385500816598)
,p_db_column_name=>'History'
,p_display_order=>110
,p_column_identifier=>'X'
,p_column_label=>'<p style="color:#337ac0;" > History </p>'
,p_column_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16:P16_PKGNAME,P16_TESTCASE:#Testcase Path#,#TESTCASE_NAME#'
,p_column_linktext=>'        <span class="fa fa-history"   style="color:Blue"></span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(90683515695154184)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'247589'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TESTCASE_NAME:Testcase Path:STATUS:Detail:History:'
,p_sort_column_1=>'Testcase Path'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'TESTCASE_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22299161092372034)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(71760052639811733)
,p_button_name=>'SHOW_LESS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(40686937944079977)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'without Info'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-binoculars'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24759382001816599)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(90670221189118328)
,p_button_name=>'SHOW_MORE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(40686937944079977)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'with Info'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-binoculars'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24755029106816595)
,p_name=>'P6_PKGPATH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86176969781635495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New'
,p_source=>'P6_PKGPATH'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>9
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(40686215320079967)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24755448571816596)
,p_name=>'P6_TEST_RUN_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86176969781635495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24759756392816600)
,p_name=>'P6_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(90670221189118328)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24760138425816600)
,p_name=>'P6_TESTCASE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(90670221189118328)
,p_use_cache_before_default=>'NO'
,p_source=>'select testcase_name from UTA_TEST_CASE where UTA_TEST_SUITE_ID= :P6_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24760534296816600)
,p_name=>'P6_PRCNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(90670221189118328)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24760983636816601)
,p_name=>'P6_HIDE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(90670221189118328)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(24761301534816605)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Show More'
,p_process_sql_clob=>':P6_HIDE :=1;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(24759382001816599)
,p_process_when=>'SHOW_MORE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22299237139372035)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Show Less'
,p_process_sql_clob=>':P6_HIDE :=0;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22299161092372034)
,p_process_when=>'SHOW_LESS'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
