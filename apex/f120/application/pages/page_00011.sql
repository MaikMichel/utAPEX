prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(40708662826080105)
,p_name=>'Latest Test Results'
,p_step_title=>'Latest Test Results'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40711335611080246)
,p_last_updated_by=>'MMI'
,p_last_upd_yyyymmddhh24miss=>'20210226154040'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48656175762122567)
,p_plug_name=>'Test Run Result'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(47272718518483549)
,p_name=>'Latest Test Run Result'
,p_parent_plug_id=>wwv_flow_api.id(48656175762122567)
,p_template=>wwv_flow_api.id(40634728512079847)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--medium:t-BadgeList--circular:t-BadgeList--cols:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from   ( select id, TOTAL_TESTS total, FAILED_TESTS FAILED, TOTAL_TESTS-( FAILED_TESTS+ERRORED_TESTS) SUCCESSED, ERRORED_TESTS ERRORED',
'        , DENSE_RANK() OVER (ORDER BY id  DESC) tc_rank from uta_test_run ',
'       )',
'      where id =nvl(:P11_TRUN_ID,:P11_TR_DEFUALT);'))
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
 p_id=>wwv_flow_api.id(22262718462195141)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(22275174706540714)
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
 p_id=>wwv_flow_api.id(22275642109540718)
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
 p_id=>wwv_flow_api.id(22276025065540720)
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
 p_id=>wwv_flow_api.id(22276434678540721)
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
 p_id=>wwv_flow_api.id(22276851700540721)
,p_query_column_id=>6
,p_column_alias=>'TC_RANK'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75248382330548459)
,p_plug_name=>'Latest Test Run Result'
,p_parent_plug_id=>wwv_flow_api.id(48656175762122567)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h240:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>'#TIMING#'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(36737523160506549)
,p_region_id=>wwv_flow_api.id(75248382330548459)
,p_chart_type=>'pie'
,p_width=>'310'
,p_height=>'300'
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
,p_legend_position=>'auto'
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
 p_id=>wwv_flow_api.id(36737862634506559)
,p_chart_id=>wwv_flow_api.id(36737523160506549)
,p_seq=>10
,p_name=>'Latest Test Run Result'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from   ( select id, TOTAL_TESTS total, FAILED_TESTS FAIL, TOTAL_TESTS-( FAILED_TESTS+ERRORED_TESTS) SUCCESS, ERRORED_TESTS ERROR',
'        , DENSE_RANK() OVER (ORDER BY id  DESC) tc_rank from uta_test_run',
'       )',
'       unpivot',
'       ( test_stats',
'         for test_result_type in ( FAIL,SUCCESS,ERROR)',
'       ) ',
'       where id =nvl(:P11_TRUN_ID,:P11_TR_DEFUALT);'))
,p_ajax_items_to_submit=>'P11_TR_DEFUALT,P11_TRUN_ID'
,p_items_value_column_name=>'TEST_STATS'
,p_items_label_column_name=>'TEST_RESULT_TYPE'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80048455192275350)
,p_plug_name=>'Test Statistics'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--showIcon:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(40634728512079847)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,TESTSUITE_NAME pkg_name,package_path,uta_test_run_id,TOTAL_TESTS total,FAILED_TESTS FAILED,',
'TOTAL_TESTS-(FAILED_TESTS+ERRORED_TESTS) SUCCESSED, ',
'ERRORED_TESTS ERRORED, DURATION_SEC "Execution Time"',
'         from UTA_TEST_SUITE where tsu_id is not null',
'     and uta_test_run_id = nvl(:P11_TRUN_ID,:P11_TR_DEFUALT) '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P11_TR_DEFUALT'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22165882690040753)
,p_name=>'UTA_TEST_RUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UTA_TEST_RUN_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22263100626195145)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22436896336680538)
,p_name=>'PACKAGE_PATH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKAGE_PATH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Package Path'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34515342236312379)
,p_name=>'SUCCESSED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUCCESSED'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Success'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config)',
'{',
'  config.features = {  canHide: false,  groupBy: false, highlight: false, pivot: false, sort: true };',
'  return config;',
'',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(34515477338312381)
,p_name=>'PKG_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PKG_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config)',
'{',
'  config.features = {  canHide: false,  groupBy: false, highlight: false, pivot: false, sort: true };',
'  return config;',
'',
'}'))
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(36684075328018948)
,p_name=>'Execution Time'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Execution Time'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Duration (in sec)'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G990D00MI'
,p_is_required=>false
,p_max_length=>80
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config)',
'{',
'  config.features = {  canHide: false,  groupBy: false, highlight: false, pivot: false, sort: true };',
'  return config;',
'',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(64701546040025409)
,p_name=>'DETAIL'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Detail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_ID,P6_PKGPATH,P6_TEST_RUN_ID:&ID.,&PACKAGE_PATH.,&UTA_TEST_RUN_ID.'
,p_link_text=>'<span aria-hidden="true" style="color:Blue" class="fa fa-binoculars"></span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config)',
'{',
'  config.features = { aggregate: false, canHide: false, compute: false, controlBreak: false, groupBy: false, highlight: false, pivot: false, sort: true };',
'  return config;',
'',
'}'))
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(64701921745025412)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Test Cases'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config)',
'{',
'  config.features = {  canHide: false,  groupBy: false, highlight: false, pivot: false, sort: true };',
'  return config;',
'',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(64701968399025413)
,p_name=>'FAILED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAILED'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Fail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config)',
'{',
'  config.features = {  canHide: false,  groupBy: false, highlight: false, pivot: false, sort: true };',
'  return config;',
'',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(64702074108025414)
,p_name=>'ERRORED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ERRORED'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Error'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config)',
'{',
'  config.features = {  canHide: false,  groupBy: false, highlight: false, pivot: false, sort: true };',
'  return config;',
'',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(80158654358926872)
,p_internal_uid=>57933804844902228
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>true
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(80326395428762597)
,p_interactive_grid_id=>wwv_flow_api.id(80158654358926872)
,p_static_id=>'497021'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(80326471571762605)
,p_report_id=>wwv_flow_api.id(80326395428762597)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22245644813020824)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(22165882690040753)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22260317578423864)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(36684075328018948)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22389878880814238)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(22263100626195145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22442872219681421)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(22436896336680538)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>475
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(36538634711050957)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(34515342236312379)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(36544841444099892)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(34515477338312381)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>321
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(64836400060331339)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(64701546040025409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(64837899497331388)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(64701921745025412)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(64838391826331390)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(64701968399025413)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(64838881088331392)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(64702074108025414)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(45878033845902716)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_execution_seq=>5
,p_name=>'Error'
,p_background_color=>'#FF7755'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(64702074108025414)
,p_condition_operator=>'NEQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'0'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(45878064987909860)
,p_view_id=>wwv_flow_api.id(80326471571762605)
,p_execution_seq=>10
,p_name=>'Fail'
,p_background_color=>'#FFDD44'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(64701968399025413)
,p_condition_operator=>'NEQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'0'
,p_is_enabled=>true
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22436986492680539)
,p_name=>'P11_TEST_EXEC_TIME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(48656175762122567)
,p_prompt=>'Execution Time'
,p_source=>'select to_char(test_run_start_date, ''dd.mm.yy hh24:mi:ss'') from uta_test_run where id = nvl(:P11_TRUN_ID, :P11_TR_DEFUALT)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34115478945316102)
,p_name=>'P11_TRUN_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(48656175762122567)
,p_use_cache_before_default=>'NO'
,p_source=>'P11_TRUN_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34140428002640649)
,p_name=>'P11_TR_DEFUALT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(48656175762122567)
,p_use_cache_before_default=>'NO'
,p_source=>'select max(UTA_TEST_RUN_ID) from UTA_TEST_SUITE'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
