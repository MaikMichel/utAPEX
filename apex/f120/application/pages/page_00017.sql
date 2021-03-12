prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(40708662826080105)
,p_name=>'Start Testing'
,p_step_title=>'Start Testing'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40711335611080246)
,p_browser_cache=>'N'
,p_last_updated_by=>'SAMBATI'
,p_last_upd_yyyymmddhh24miss=>'20191120181336'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(66067199544684524)
,p_plug_name=>'DSG TESTING'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(40644051146079869)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(36520312046755801)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(66067199544684524)
,p_button_name=>'Run_all'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(40686937944079977)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Run all tests'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-rocket'
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(36519958785755783)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(66067199544684524)
,p_button_name=>'Run_selected'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(40686937944079977)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Run Selected'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-rocket'
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(36523280684756385)
,p_branch_name=>'Go To Page 3'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_OWNER:&P17_OWNER.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22165988162040754)
,p_name=>'P17_ERROR_MESSAGE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(66067199544684524)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36520719850755813)
,p_name=>'P17_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(66067199544684524)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User Name'
,p_source=>'P17_OWNER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'OWNER LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct username d,username r from all_users where Oracle_Maintained =''N'' and username not in (''APEX_LISTENER'', ''APEX_REST_PUBLIC_USER'')order by username',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36521140370755865)
,p_name=>'P17_DIR_PATH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(66067199544684524)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Suite Path'
,p_source=>'P17_DIR_PATH'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SUITE PATH LIST'
,p_lov=>'select path d, path r from table(ut_runner.get_suites_info(NVL(:P17_OWNER,''NOBODY''))) where item_type = ''UT_LOGICAL_SUITE'' order by path'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P17_OWNER'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36521444345755889)
,p_name=>'P17_NOTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(66067199544684524)
,p_prompt=>'<b>Note</b>: If you want to test all packages from above selected path please click on ''Run all tests'' button. For specific package please select required test package(s) from below list of values and click on ''Run Selected'' button'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36521790409755914)
,p_name=>'P17_PACKAGE_NAMES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(66067199544684524)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Select Package Name(s) which need to be tested'
,p_source=>'P17_PACKAGE_NAMES'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SHUTTLE'
,p_named_lov=>'TEST PACKAGES LIST'
,p_lov=>'select OBJECT_NAME d, :P17_OWNER||''.''||OBJECT_NAME r from table(ut_runner.get_suites_info(NVL(:P17_OWNER, ''NO''))) where item_type = ''UT_SUITE'' and Path like nvl(:P17_DIR_PATH||''%'',path) order by object_name'
,p_lov_cascade_parent_items=>'P17_OWNER,P17_DIR_PATH'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'ALL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36522208204755916)
,p_name=>'P17_PROCEDURES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(66067199544684524)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Select Required Procedures for above selected Packages'
,p_source=>'P17_PROCEDURES'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SHUTTLE'
,p_named_lov=>'TEST CASES LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name||''.''||ITEM_NAME d, :P17_OWNER||''.''||object_name||''.''||ITEM_NAME r from table(ut_runner.get_suites_info(:P17_OWNER))',
'where item_type = ''UT_TEST'' and object_name in (select  ',
'                                column_value  ',
'                            from  ',
'                                table(apex_string.split(replace(:P17_PACKAGE_NAMES,:P17_OWNER||''.'',''''), '':''))) order by object_name',
''))
,p_lov_cascade_parent_items=>'P17_PACKAGE_NAMES'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(40685950335079960)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'ALL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36522889483756357)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Run selected'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'if :P17_PACKAGE_NAMES is null then',
'     uta_run_api.uta_run_all(p_owner =>:P17_OWNER,',
'                         p_suite_path=>:P17_DIR_PATH, ',
'                         p_errror_message =>:P17_ERROR_MESSAGE );',
'     else',
'     uta_run_api.uta_run(',
'         P_pkg_name => :P17_PACKAGE_NAMES,',
'         P_prc_name =>:P17_PROCEDURES, ',
'         P_OWNER  =>:P17_OWNER,',
'         p_errror_message =>:P17_ERROR_MESSAGE );',
'      end if;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Oh Nooooooooooo!! Call the damm Developer!!'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(36519958785755783)
,p_process_success_message=>'Success'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36522598181756339)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Run all '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'     uta_run_api.uta_run_all(p_owner =>:P17_OWNER,',
'                         p_suite_path=>:P17_DIR_PATH, ',
'                         p_errror_message =>:P17_ERROR_MESSAGE );',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(36520312046755801)
);
end;
/
