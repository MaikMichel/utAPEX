prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(40708662826080105)
,p_name=>'Latest Test Runs'
,p_step_title=>'Over View'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40711335611080246)
,p_last_updated_by=>'MMI'
,p_last_upd_yyyymmddhh24miss=>'20210226180842'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34144106587640686)
,p_plug_name=>'Latest Test Run Result'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<font size="1">Last updated on &P3_LAST_EXECUTION.</font>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(45494229030976121)
,p_name=>'Latest Test Run Result'
,p_parent_plug_id=>wwv_flow_api.id(34144106587640686)
,p_template=>wwv_flow_api.id(40634728512079847)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--medium:t-BadgeList--circular:t-BadgeList--cols:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'     select *',
'from   ( select id ,TOTAL_TESTS total, FAILED_TESTS FAILED, TOTAL_TESTS-( FAILED_TESTS+ERRORED_TESTS) SUCCESSED, ERRORED_TESTS ERRORED',
'        , DENSE_RANK() OVER (ORDER BY id  DESC) tc_rank from (SELECT nvl(test_run_group_id, id) id, sum(TOTAL_TESTS) TOTAL_TESTS, sum(FAILED_TESTS) FAILED_TESTS, sum(ERRORED_TESTS) ERRORED_TESTS             ',
'  FROM uta_test_run',
' group by nvl(test_run_group_id, id)) ',
'       )',
'     where tc_rank =nvl(:P3_TC_RANK,1);'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(40653553171079896)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No test(s) has been run.'
,p_csv_output=>'N'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>8.5
,p_prn_height=>11
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
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(22505973255669351)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(34068289780457301)
,p_query_column_id=>2
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>1
,p_column_heading=>'Total Tests'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<div style="background-color:darkblue; ">#TOTAL#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(34068684046457302)
,p_query_column_id=>3
,p_column_alias=>'FAILED'
,p_column_display_sequence=>3
,p_column_heading=>'Fail'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_TR_ID:#ID#'
,p_column_linktext=>'<div style="background-color:#FF8000; ">#FAILED#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(34067927024457288)
,p_query_column_id=>4
,p_column_alias=>'SUCCESSED'
,p_column_display_sequence=>2
,p_column_heading=>'Success'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP,15:P15_TR_ID:#ID#'
,p_column_linktext=>'<div style="background-color:#088A4B; ">#SUCCESSED#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(34069120143457302)
,p_query_column_id=>5
,p_column_alias=>'ERRORED'
,p_column_display_sequence=>4
,p_column_heading=>'Error'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10:P10_TR_ID:#ID#'
,p_column_linktext=>'<div style="background-color:#DF0101; ">#ERRORED#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(34140052941640646)
,p_query_column_id=>6
,p_column_alias=>'TC_RANK'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(60736313156066578)
,p_plug_name=>'Latest Test Run Result'
,p_parent_plug_id=>wwv_flow_api.id(34144106587640686)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(34064019244456915)
,p_region_id=>wwv_flow_api.id(60736313156066578)
,p_chart_type=>'pie'
,p_width=>'280'
,p_height=>'280'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'No test(s) has been run.'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options){',
'options.dataFilter = function(data){',
'data.series[0].color="#FF8000";',
'data.series[1].color="#088A4B";',
'data.series[2].color="#DF0101";',
'return data;',
'};',
'return options;',
'}'))
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(34064392021456960)
,p_chart_id=>wwv_flow_api.id(34064019244456915)
,p_seq=>10
,p_name=>'Latest Test Run Result'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'FROM',
'  (SELECT TOTAL_TESTS total,',
'    FAILED_TESTS fail,',
'    TOTAL_TESTS-( FAILED_TESTS+ERRORED_TESTS) success,',
'    ERRORED_TESTS error ,',
'    DENSE_RANK() OVER (ORDER BY id DESC) tc_rank',
'  FROM (SELECT nvl(test_run_group_id, id) id, sum(TOTAL_TESTS) TOTAL_TESTS, sum(FAILED_TESTS) FAILED_TESTS, sum(ERRORED_TESTS) ERRORED_TESTS             ',
'  FROM uta_test_run',
' group by nvl(test_run_group_id, id))',
'  ) unpivot ( test_stats FOR test_result_type IN ( fail,success,error) )',
'  WHERE tc_rank                                  =NVL(:P3_TC_RANK,1);'))
,p_items_value_column_name=>'TEST_STATS'
,p_items_label_column_name=>'TEST_RESULT_TYPE'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36558336120175075)
,p_plug_name=>'Test Runs Report'
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34144574078640691)
,p_plug_name=>'Test Runs Report'
,p_parent_plug_id=>wwv_flow_api.id(36558336120175075)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,TEST_RUN_START_DATE Start_date,to_number(TOTAL_TESTS) Testcase_totalcount, to_number(TOTAL_TESTS) -( to_number(ERRORED_TESTS)+ to_number(FAILED_TESTS)) TESTCASE_SUCCESSCOUNT,',
'to_number(ERRORED_TESTS) TESTCASE_ERRORCOUNT,',
'       to_number(FAILED_TESTS) TESTCASE_FAILCOUNT, DURATION_SEC "Test_Duartion", '''' "Detail",',
'      test_run_group_id,',
'      test_title',
'  from uta_test_run'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
 p_id=>wwv_flow_api.id(34144716552640692)
,p_max_row_count=>'1000'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_detail_link=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'TESTER'
,p_internal_uid=>11919867038616048
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34513492789312361)
,p_db_column_name=>'TESTCASE_TOTALCOUNT'
,p_display_order=>40
,p_column_identifier=>'K'
,p_column_label=>'Tests'
,p_allow_highlighting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34513611568312362)
,p_db_column_name=>'TESTCASE_SUCCESSCOUNT'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Success'
,p_allow_highlighting=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34513656727312363)
,p_db_column_name=>'TESTCASE_FAILCOUNT'
,p_display_order=>70
,p_column_identifier=>'M'
,p_column_label=>'Fail'
,p_allow_highlighting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34513762155312364)
,p_db_column_name=>'TESTCASE_ERRORCOUNT'
,p_display_order=>80
,p_column_identifier=>'N'
,p_column_label=>'Error'
,p_allow_highlighting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34515114182312377)
,p_db_column_name=>'ID'
,p_display_order=>100
,p_column_identifier=>'U'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(36686684397018974)
,p_db_column_name=>'Test_Duartion'
,p_display_order=>130
,p_column_identifier=>'X'
,p_column_label=>'Duartion (in sec)'
,p_allow_highlighting=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(36859409870469265)
,p_db_column_name=>'Detail'
,p_display_order=>140
,p_column_identifier=>'Y'
,p_column_label=>'Detail'
,p_column_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_TRUN_ID:#ID#'
,p_column_linktext=>' <span class="fa fa-binoculars" style="color:Blue" ></span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22661225344657156)
,p_db_column_name=>'START_DATE'
,p_display_order=>150
,p_column_identifier=>'AA'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51401040346711910)
,p_db_column_name=>'TEST_RUN_GROUP_ID'
,p_display_order=>160
,p_column_identifier=>'AB'
,p_column_label=>'GroupID'
,p_column_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:11:P11_TRUNGRP_ID:#TEST_RUN_GROUP_ID#'
,p_column_linktext=>' <span class="fa fa-binoculars" style="color:Orange" ></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51401119439711911)
,p_db_column_name=>'TEST_TITLE'
,p_display_order=>170
,p_column_identifier=>'AC'
,p_column_label=>'Label'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(34318159445885872)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'120934'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'START_DATE:TESTCASE_TOTALCOUNT:TESTCASE_SUCCESSCOUNT:TESTCASE_FAILCOUNT:TESTCASE_ERRORCOUNT:Test_Duartion:Detail::TEST_RUN_GROUP_ID:TEST_TITLE'
,p_sort_column_1=>'START_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'Begins at'
,p_sort_direction_2=>'DESC'
,p_break_on=>'0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36686582679018973)
,p_plug_name=>'Last 7 Days Test Report Graphical View'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<font size="1">Last updated on &P3_LAST_EXECUTION.</font>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36860921472469280)
,p_plug_name=>'Last 7 Days Test Report Graphical View'
,p_parent_plug_id=>wwv_flow_api.id(36686582679018973)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(36860977007469281)
,p_region_id=>wwv_flow_api.id(36860921472469280)
,p_chart_type=>'bar'
,p_height=>'280'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'live'
,p_initial_zooming=>'none'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_time_axis_type=>'skipGaps'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(36861437240469285)
,p_chart_id=>wwv_flow_api.id(36860977007469281)
,p_seq=>10
,p_name=>'Total Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'       TEST_RUN_START_DATE execution_Time,',
'      total_tests',
'  from uta_TEST_RUN',
' where TEST_RUN_START_DATE between',
' (sysdate-nvl(to_number(REGEXP_REPLACE(7, ''[^0-9]+'', '''')),0)) and (sysdate-nvl(to_number(REGEXP_REPLACE(7, ''[^0-9]+'', '''')),0)+7)  order by TEST_RUN_START_DATE asc'))
,p_items_value_column_name=>'TOTAL_TESTS'
,p_items_label_column_name=>'EXECUTION_TIME'
,p_color=>'#08088A'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(36861073044469282)
,p_chart_id=>wwv_flow_api.id(36860977007469281)
,p_seq=>20
,p_name=>'Success Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
' TEST_RUN_START_DATE execution_Time,',
'      total_tests TESTCASE_TOTALCOUNT,',
'       total_tests- (FAILED_TESTS+ERRORED_TESTS) TESTCASE_SUCCESSCOUNT',
'  from uta_TEST_RUN',
' where TEST_RUN_START_DATE between',
' (sysdate-nvl(to_number(REGEXP_REPLACE(7, ''[^0-9]+'', '''')),0)) and (sysdate-nvl(to_number(REGEXP_REPLACE(7, ''[^0-9]+'', '''')),0)+7)  order by TEST_RUN_START_DATE asc'))
,p_items_value_column_name=>'TESTCASE_SUCCESSCOUNT'
,p_items_label_column_name=>'EXECUTION_TIME'
,p_color=>'#088A4B'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(36861258003469284)
,p_chart_id=>wwv_flow_api.id(36860977007469281)
,p_seq=>30
,p_name=>'Fail Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'  TEST_RUN_START_DATE execution_Time,',
'       total_tests TESTCASE_TOTALCOUNT,',
'       FAILED_TESTS TESTCASE_FAILCOUNT',
'  from uta_TEST_RUN',
' where TEST_RUN_START_DATE between',
' (sysdate-nvl(to_number(REGEXP_REPLACE(7, ''[^0-9]+'', '''')),0)) and (sysdate-nvl(to_number(REGEXP_REPLACE(7, ''[^0-9]+'', '''')),0)+7)  order by TEST_RUN_START_DATE asc'))
,p_items_value_column_name=>'TESTCASE_FAILCOUNT'
,p_items_label_column_name=>'EXECUTION_TIME'
,p_color=>'#FF8000'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(36861177056469283)
,p_chart_id=>wwv_flow_api.id(36860977007469281)
,p_seq=>40
,p_name=>'Error Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'  TEST_RUN_START_DATE execution_Time,',
'       total_tests TESTCASE_TOTALCOUNT,',
'       ERRORED_TESTS TESTCASE_ERRORCOUNT',
'  from uta_TEST_RUN',
' where TEST_RUN_START_DATE between',
' (sysdate-nvl(to_number(REGEXP_REPLACE(7, ''[^0-9]+'', '''')),0)) and (sysdate-nvl(to_number(REGEXP_REPLACE(7, ''[^0-9]+'', '''')),0)+7)  order by TEST_RUN_START_DATE asc'))
,p_items_value_column_name=>'TESTCASE_ERRORCOUNT'
,p_items_label_column_name=>'EXECUTION_TIME'
,p_color=>'#FF0000'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(36861627833469287)
,p_chart_id=>wwv_flow_api.id(36860977007469281)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'TestCase Count'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(36861710433469288)
,p_chart_id=>wwv_flow_api.id(36860977007469281)
,p_axis=>'y2'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
,p_tick_label_rendered=>'on'
,p_split_dual_y=>'off'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(36861777163469289)
,p_chart_id=>wwv_flow_api.id(36860977007469281)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Executed Time'
,p_format_type=>'date-short'
,p_numeric_pattern=>'dd.MM.yy HH:mm:ss'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36687514369018982)
,p_plug_name=>'Existing Test Cases Statistics'
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36687617713018983)
,p_plug_name=>'Test Runs Report'
,p_parent_plug_id=>wwv_flow_api.id(36687514369018982)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT utsp.Object_name "Testsuite Name",',
'  utsp.item_name "Testcase Name",',
'  utsp.path "Testcase Path",',
'  utc.testcase_path path,',
'  utc.testcase_name name ,',
'  MAX(utc.executed_on) "Last Executed",',
'  '''' History',
'FROM TABLE(ut_runner.get_suites_info(NVL(:P3_USER,''NOBODY''))) utsp',
'LEFT JOIN UTA_TEST_CASE utc',
'ON SUBSTR(path, 1, instr(path, ''.'', -1)-1)            = utc.testcase_path',
'AND NVL(utsp.item_description, lower(utsp.item_name)) = utc.testcase_name',
'WHERE utsp.item_type                                  = ''UT_TEST''',
'GROUP BY utsp.Object_name,',
'  utsp.item_name,',
'  utsp.path,',
'  utc.testcase_path,',
'  utc.testcase_name;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_USER'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
 p_id=>wwv_flow_api.id(36687664713018984)
,p_max_row_count=>'1000'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>230
,p_show_detail_link=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'TESTER'
,p_internal_uid=>14462815198994340
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22505612848669347)
,p_db_column_name=>'Testsuite Name'
,p_display_order=>80
,p_column_identifier=>'N'
,p_column_label=>'Testsuite Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22505721729669348)
,p_db_column_name=>'Testcase Name'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'Testcase Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22505855015669349)
,p_db_column_name=>'Testcase Path'
,p_display_order=>100
,p_column_identifier=>'P'
,p_column_label=>'Testcase Path'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22660777911657152)
,p_db_column_name=>'Last Executed'
,p_display_order=>110
,p_column_identifier=>'Q'
,p_column_label=>'Last Executed'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd.mm.yy hh24:mi:ss'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22438011903680549)
,p_db_column_name=>'HISTORY'
,p_display_order=>120
,p_column_identifier=>'R'
,p_column_label=>'History'
,p_column_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16:P16_PKGNAME,P16_TESTCASE:#PATH#,#NAME#'
,p_column_linktext=>'        <span class="fa fa-history"   style="color:Blue"></span>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22438070930680550)
,p_db_column_name=>'PATH'
,p_display_order=>130
,p_column_identifier=>'S'
,p_column_label=>'Path'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22438226187680551)
,p_db_column_name=>'NAME'
,p_display_order=>140
,p_column_identifier=>'T'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(36866662603470913)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'146419'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Testsuite Name:Testcase Name:Last Executed:HISTORY:'
,p_sort_column_1=>'Testsuite Name'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'Testcase Name'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(22989866778380180)
,p_report_id=>wwv_flow_api.id(36866662603470913)
,p_name=>'not executed'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'Last Executed'
,p_operator=>'is null'
,p_condition_sql=>' (case when ("Last Executed" is null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFDD44'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22262968304195144)
,p_name=>'P3_OWNER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(36687617713018983)
,p_use_cache_before_default=>'NO'
,p_source=>'P3_OWNER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22437700292680546)
,p_name=>'P3_USER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(36687617713018983)
,p_prompt=>'User'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'OWNER LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct username d,username r from all_users where Oracle_Maintained =''N'' and username not in (''APEX_LISTENER'', ''APEX_REST_PUBLIC_USER'')order by username',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34070327950457331)
,p_name=>'P3_LAST_EXECUTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(34144106587640686)
,p_use_cache_before_default=>'NO'
,p_source=>'select to_char(max(TEST_RUN_START_DATE),''DD-MON-YYYY hh24:mi:ss'') from uta_test_run;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34140040535640645)
,p_name=>'P3_TC_RANK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(45494229030976121)
,p_use_cache_before_default=>'NO'
,p_source=>'P3_TC_RANK'
,p_source_type=>'ITEM'
,p_source_post_computation=>'NVL(:P3_TC_RANK,1)'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22437840057680547)
,p_name=>'RELOAD'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_USER'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22437907644680548)
,p_event_id=>wwv_flow_api.id(22437840057680547)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(36687617713018983)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34075155786457504)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'back'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P3_TC_RANK:= :P3_TC_RANK+1;',
':P3_THISWEEK := nvl(to_number(REGEXP_REPLACE(:P3_THISWEEK, ''[^0-9]+'', '''')),0) +7;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34075465632457532)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'today'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P3_TC_RANK:= 1;',
':P3_THISWEEK :=7;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34075860336457533)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'next'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P3_TC_RANK:= :P3_TC_RANK-1;',
':P3_THISWEEK := nvl(to_number(REGEXP_REPLACE(:P3_THISWEEK, ''[^0-9]+'', '''')),0) -7;',
' '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
