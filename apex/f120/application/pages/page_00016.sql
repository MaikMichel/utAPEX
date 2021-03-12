prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(40708662826080105)
,p_name=>'History'
,p_page_mode=>'MODAL'
,p_step_title=>'History'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40711335611080246)
,p_dialog_height=>'500'
,p_dialog_width=>'850'
,p_dialog_chained=>'N'
,p_last_updated_by=>'MBECKER'
,p_last_upd_yyyymmddhh24miss=>'20191120175313'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53164430055557916)
,p_plug_name=>'Test Details'
,p_icon_css_classes=>'fa-history'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40633550797079838)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT utc.id,',
'      executed_on execution_time,',
'      uts.testsuite_name,',
'      utc.testcase_path,',
'      utc.testcase_name,',
'      nvl(test_status,''Success'') test_status,',
'      '''' "Detail"',
'FROM uta_test_case utc,',
'  uta_test_suite uts',
'WHERE utc.uta_test_suite_id=uts.id',
'AND utc.testcase_name      = :P16_TESTCASE',
'AND utc.testcase_path      =:P16_PKGNAME',
'ORDER BY executed_on'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P16_TESTCASE,P16_PKGNAME'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(53164548780557916)
,p_name=>'Test Details'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'TESTER'
,p_internal_uid=>30939699266533272
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(36555474995175047)
,p_db_column_name=>'TESTCASE_NAME'
,p_display_order=>30
,p_column_identifier=>'S'
,p_column_label=>'Testcase Name'
,p_allow_highlighting=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(36556693350175059)
,p_db_column_name=>'EXECUTION_TIME'
,p_display_order=>60
,p_column_identifier=>'AC'
,p_column_label=>'Execution Time'
,p_allow_highlighting=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd.MON.yy hh24:mi:ss'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(36557715260175069)
,p_db_column_name=>'ID'
,p_display_order=>70
,p_column_identifier=>'AD'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(36686796760018975)
,p_db_column_name=>'Detail'
,p_display_order=>80
,p_column_identifier=>'AE'
,p_column_label=>'<p style="color:#337ac0;" >Detail </p>'
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_ID,P7_EXECUTED_ON:#ID#,#EXECUTION_TIME#'
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
 p_id=>wwv_flow_api.id(22660487361657149)
,p_db_column_name=>'TESTSUITE_NAME'
,p_display_order=>90
,p_column_identifier=>'AF'
,p_column_label=>'Testsuite Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22660656345657150)
,p_db_column_name=>'TESTCASE_PATH'
,p_display_order=>100
,p_column_identifier=>'AG'
,p_column_label=>'Testcase Path'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59669866615887442)
,p_db_column_name=>'TEST_STATUS'
,p_display_order=>110
,p_column_identifier=>'AJ'
,p_column_label=>'Test Status'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(53177724561593772)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'119890'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EXECUTION_TIME:TESTCASE_NAME:TESTSUITE_NAME:TESTCASE_PATH:TEST_STATUS:Detail:'
,p_sort_column_1=>'EXECUTION_TIME'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34214512429081911)
,p_name=>'P16_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53164430055557916)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34215044147081951)
,p_name=>'P16_TESTCASE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53164430055557916)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34215399475081952)
,p_name=>'P16_PKGNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(53164430055557916)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
