prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(40708662826080105)
,p_name=>'Test Runs Report'
,p_step_title=>'Test Runs Report'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40711335611080246)
,p_last_updated_by=>'MBECKER'
,p_last_upd_yyyymmddhh24miss=>'20191120181007'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51527482385052903)
,p_plug_name=>'Test Run Report'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49113720343518519)
,p_plug_name=>'Test Runs Report'
,p_parent_plug_id=>wwv_flow_api.id(51527482385052903)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select id,TEST_RUN_START_DATE Start_date,to_number(TOTAL_TESTS) Testcase_totalcount, to_number(TOTAL_TESTS) -( to_number(ERRORED_TESTS)+ to_number(FAILED_TESTS)) TESTCASE_SUCCESSCOUNT,',
'to_number(ERRORED_TESTS) TESTCASE_ERRORCOUNT,',
'       to_number(FAILED_TESTS) TESTCASE_FAILCOUNT, DURATION_SEC, '''' "Detail", '''' "Delete"',
'  from uta_test_run',
'  where test_run_start_date >= sysdate - :P2_RANGE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2_RANGE'
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
 p_id=>wwv_flow_api.id(49113862817518520)
,p_max_row_count=>'1000'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_finder_drop_down=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_highlight=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'TESTER'
,p_internal_uid=>26889013303493876
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37194523560902771)
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
 p_id=>wwv_flow_api.id(37194758725902772)
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
 p_id=>wwv_flow_api.id(37195223246902773)
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
 p_id=>wwv_flow_api.id(37195561644902773)
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
 p_id=>wwv_flow_api.id(37196043199902774)
,p_db_column_name=>'ID'
,p_display_order=>100
,p_column_identifier=>'U'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(37196835391902789)
,p_db_column_name=>'START_DATE'
,p_display_order=>120
,p_column_identifier=>'W'
,p_column_label=>'Start Date'
,p_allow_highlighting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd.mm.yy hh24:mi:ss'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(36859283144469264)
,p_db_column_name=>'Detail'
,p_display_order=>140
,p_column_identifier=>'Y'
,p_column_label=>'Detail'
,p_column_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_TRUN_ID:#ID#'
,p_column_linktext=>'    <span class="fa fa-binoculars" style="color:Blue" ></span>'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_security_scheme=>wwv_flow_api.id(40711335611080246)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22437634560680545)
,p_db_column_name=>'DURATION_SEC'
,p_display_order=>150
,p_column_identifier=>'Z'
,p_column_label=>'Duration (in sec)'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64779237780128748)
,p_db_column_name=>'Delete'
,p_display_order=>160
,p_column_identifier=>'AA'
,p_column_label=>'Delete'
,p_column_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4:P4_TEST_RUN_ID:#ID#'
,p_column_linktext=>'<span class="fa fa-trash-o" style="color:Blue" ></span>'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(49287305710763700)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'149727'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'START_DATE:TESTCASE_TOTALCOUNT:TESTCASE_SUCCESSCOUNT:TESTCASE_FAILCOUNT:TESTCASE_ERRORCOUNT:DURATION_SEC:Detail::Delete'
,p_sort_column_1=>'START_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51659931019901739)
,p_plug_name=>'Test Report Graphical View'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51531136289057836)
,p_plug_name=>'Test Report Graphical View'
,p_parent_plug_id=>wwv_flow_api.id(51659931019901739)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(37198824794907427)
,p_region_id=>wwv_flow_api.id(51531136289057836)
,p_chart_type=>'line'
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
,p_time_axis_type=>'mixedFrequency'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(37202657361907560)
,p_chart_id=>wwv_flow_api.id(37198824794907427)
,p_seq=>10
,p_name=>'Total Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       TEST_RUN_START_DATE,',
'       to_number(TOTAL_TESTS)',
'  from uta_test_run',
'  where TEST_RUN_START_DATE >= sysdate - :P2_RANGE',
'   order by TEST_RUN_START_DATE asc'))
,p_ajax_items_to_submit=>'P2_RANGE'
,p_items_value_column_name=>'TO_NUMBER(TOTAL_TESTS)'
,p_items_label_column_name=>'TEST_RUN_START_DATE'
,p_color=>'#08088A'
,p_line_style=>'solid'
,p_line_width=>1
,p_line_type=>'straight'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'none'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(37200961767907551)
,p_chart_id=>wwv_flow_api.id(37198824794907427)
,p_seq=>20
,p_name=>'Success Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       TEST_RUN_START_DATE,',
'       to_number(TOTAL_TESTS),',
'       to_number(TOTAL_TESTS) -( to_number(ERRORED_TESTS)+ to_number(FAILED_TESTS)) TESTCASE_SUCCESSCOUNT',
'  from uta_test_run',
'  where TEST_RUN_START_DATE >= sysdate - :P2_RANGE',
'   order by TEST_RUN_START_DATE asc'))
,p_ajax_items_to_submit=>'P2_RANGE'
,p_items_value_column_name=>'TESTCASE_SUCCESSCOUNT'
,p_items_label_column_name=>'TEST_RUN_START_DATE'
,p_color=>'#088A4B'
,p_line_style=>'solid'
,p_line_width=>1
,p_line_type=>'curved'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(37201571900907559)
,p_chart_id=>wwv_flow_api.id(37198824794907427)
,p_seq=>30
,p_name=>'Error Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       TEST_RUN_START_DATE,',
'       to_number(TOTAL_TESTS) TESTCASE_TOTALCOUNT,',
'       to_number(ERRORED_TESTS) TESTCASE_ERRORCOUNT',
'  from uta_test_run',
'  where TEST_RUN_START_DATE >= sysdate - :P2_RANGE',
'   order by TEST_RUN_START_DATE asc'))
,p_ajax_items_to_submit=>'P2_RANGE'
,p_items_value_column_name=>'TESTCASE_ERRORCOUNT'
,p_items_label_column_name=>'TEST_RUN_START_DATE'
,p_color=>'#FF0000'
,p_line_style=>'dashed'
,p_line_type=>'straight'
,p_marker_rendered=>'on'
,p_marker_shape=>'triangleDown'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'aboveMarker'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(37202059746907559)
,p_chart_id=>wwv_flow_api.id(37198824794907427)
,p_seq=>40
,p_name=>'Fail Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       TEST_RUN_START_DATE,',
'       to_number(TOTAL_TESTS) TESTCASE_TOTALCOUNT,',
'       to_number(FAILED_TESTS) TESTCASE_FAILCOUNT',
'  from uta_test_run',
'  where TEST_RUN_START_DATE >= sysdate - :P2_RANGE',
'   order by TEST_RUN_START_DATE asc'))
,p_ajax_items_to_submit=>'P2_RANGE'
,p_items_value_column_name=>'TESTCASE_FAILCOUNT'
,p_items_label_column_name=>'TEST_RUN_START_DATE'
,p_color=>'#FF8000'
,p_line_style=>'dotted'
,p_line_type=>'stepped'
,p_marker_rendered=>'off'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(37199789581907500)
,p_chart_id=>wwv_flow_api.id(37198824794907427)
,p_axis=>'y2'
,p_is_rendered=>'off'
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
 p_id=>wwv_flow_api.id(37200372174907501)
,p_chart_id=>wwv_flow_api.id(37198824794907427)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'datetime-short'
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
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(37199270730907496)
,p_chart_id=>wwv_flow_api.id(37198824794907427)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22295860218372001)
,p_name=>'P2_RANGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51531136289057836)
,p_item_default=>'7'
,p_prompt=>'Range'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:last 1 day;1,last 2 days;2,last 7 days;7,last 30 days;30,last 90 days;90,last 180 days;180,last 365 days;365'
,p_cHeight=>1
,p_grid_column=>10
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22295929247372002)
,p_name=>'reload graphical view'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_RANGE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22296032261372003)
,p_event_id=>wwv_flow_api.id(22295929247372002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(51659931019901739)
);
end;
/
