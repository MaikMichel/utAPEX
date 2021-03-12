set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>2300137835156253
,p_default_application_id=>120
,p_default_id_offset=>0
,p_default_owner=>'TAYRA_APP'
);
end;
/
 
prompt APPLICATION 120 - utPLSQL Testing App
--
-- Application Export:
--   Application:     120
--   Name:            utPLSQL Testing App
--   Exported By:     TAYRA_APP
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     13
--       Items:                   38
--       Processes:               12
--       Regions:                 35
--       Buttons:                  7
--       Dynamic Actions:          3
--     Shared Components:
--       Logic:
--         Items:                  1
--         Processes:              1
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--       Security:
--         Authentication:         4
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--           Page:                 9
--           Region:              16
--           Label:                7
--           List:                12
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               3
--           Report:              10
--         LOVs:                   5
--         Shortcuts:              1
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--       Install scripts:          2
--   Version:         20.2.0.00.20
--   Instance ID:     500182988624231
--

