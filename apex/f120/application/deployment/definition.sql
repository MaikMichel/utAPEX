prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(38136013306974055)
,p_welcome_message=>'This application installer will guide you through the process of creating your database objects and seed data.'
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_deinstall_success_message=>'Deinstallation complete.'
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SYNONYM:CREATE TABLE:CREATE TRIGGER:CREATE TYPE :CREATE VIEW'
,p_required_names_available=>'TEST_RUN:TEST_RUN_DETAILS:TEST_RUN_PACKAGES:TEST_RUN_BIU:TEST_RUN_DETAILS_BIU:TEST_RUN_PACKAGES_BIU:TEST_STATISTICS_API:UT:UT_ANNOTATION_MANAGER:UT_ANNOTATION:UT_ANNOTATIONS'
);
end;
/
