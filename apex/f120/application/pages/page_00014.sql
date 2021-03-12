prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(40708662826080105)
,p_name=>'Latest Fail Report'
,p_step_title=>'Latest Fail Report'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40711335611080246)
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20191004122509'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22437275059680542)
,p_plug_name=>'Failed Tests Report'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22507126752669362)
,p_plug_name=>'Required Treatment'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40633550797079838)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select utc.id,uts.testsuite_name "Testsuite Name",',
'       utc.testcase_name "Testcase Name",',
'       utc.test_status "Test Status",',
'       ''Detail'' "Detail" ',
'from uta_test_case utc,uta_test_suite uts',
'where utc.uta_test_suite_id=uts.id ',
'and uts.uta_test_run_id =:P14_TR_ID',
'and utc.test_status =''Failure'' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P14_TR_ID'
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
 p_id=>wwv_flow_api.id(22507457689669365)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No tests required treatment'
,p_allow_save_rpt_public=>'Y'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_rows_per_page=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>2010998463636128
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22565243336073247)
,p_db_column_name=>'ID'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22565273305073248)
,p_db_column_name=>'Testsuite Name'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Testsuite Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22565375688073249)
,p_db_column_name=>'Testcase Name'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Testcase Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22565512412073250)
,p_db_column_name=>'Test Status'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Test Status'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22659920319657143)
,p_db_column_name=>'Detail'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Detail'
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_ID:#ID#'
,p_column_linktext=>'<span aria-hidden="true" style="color:Blue" class="fa fa-binoculars"></span>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(22555067563998012)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20587'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:Testsuite Name:Testcase Name:Test Status:Detail'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68795796004476256)
,p_plug_name=>'Required Treatment'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40633550797079838)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select utc.id,uts.testsuite_name "Testsuite Name",',
'       utc.testcase_name "Testcase Name",',
'       utc.test_status "Test Status",',
'       ''Detail'' "Detail" ',
'from uta_test_case utc,uta_test_suite uts',
'where utc.uta_test_suite_id=uts.id ',
'and uts.uta_test_run_id = :P15_TR_DEFAULT',
'and utc.test_status =''Failure'' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P14_TR_ID'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(68795851263476256)
,p_name=>'Required Treatment'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No tests required treatment'
,p_allow_save_rpt_public=>'Y'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_rows_per_page=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'TESTER'
,p_internal_uid=>46571001749451612
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22564772410073243)
,p_db_column_name=>'ID'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22564912748073244)
,p_db_column_name=>'Testsuite Name'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Testsuite Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22564996499073245)
,p_db_column_name=>'Testcase Name'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Testcase Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22565148281073246)
,p_db_column_name=>'Test Status'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Test Status'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22659853297657142)
,p_db_column_name=>'Detail'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'Detail'
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_ID:#ID#'
,p_column_linktext=>'<span aria-hidden="true" style="color:Blue" class="fa fa-binoculars"></span>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(68798529363479653)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'119023'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TEST_TESTCASE:ID:Testsuite Name:Testcase Name:Test Status:Detail'
,p_sort_column_1=>'Testsuite Name'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'Testcase Name'
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
 p_id=>wwv_flow_api.id(22941894698290556)
,p_name=>'P14_TR_DEFAULT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(22437275059680542)
,p_use_cache_before_default=>'NO'
,p_source=>'select max(UTA_TEST_RUN_ID) from UTA_TEST_SUITE'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22947531198466029)
,p_name=>'P14_TEST_EXEC_TIME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(22437275059680542)
,p_prompt=>'Execution Time'
,p_source=>'select to_char(test_run_start_date, ''dd.MON.yy hh24:mi:ss'') from uta_test_run where id = nvl(:P14_TR_ID, :P14_TR_DEFAULT)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34127993351389136)
,p_name=>'P14_TR_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22437275059680542)
,p_use_cache_before_default=>'NO'
,p_source=>'P14_TR_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
);
end;
/
