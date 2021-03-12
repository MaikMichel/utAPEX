  CREATE OR REPLACE EDITIONABLE PACKAGE BODY uta_run_api 
IS
    -- To concatinate the table data
    FUNCTION tab_to_string (
        p_varchar2_tab  IN      t_varchar2_tab,
        p_delimiter     IN      VARCHAR2 DEFAULT ',')
    RETURN clob IS
        l_string     clob;
    BEGIN
        FOR i IN p_varchar2_tab.FIRST .. p_varchar2_tab.LAST
        LOOP
            IF i != p_varchar2_tab.FIRST THEN
                l_string := l_string || p_delimiter;
            END IF;
            l_string := l_string || p_varchar2_tab(i);
        END LOOP;
        RETURN l_string;
    END tab_to_string;
    -- Run utPLSQL Tests with given parameter values
    FUNCTION run_tests(
        p_pkg_name  IN      VARCHAR2,
        p_prc_name  IN      VARCHAR2 DEFAULT NULL,
        p_suitepath IN      VARCHAR2 DEFAULT NULL)
    RETURN CLOB
    AS
        l_test_run_result_xml CLOB;
        l_test_result t_varchar2_tab;
        l_pkg_name       VARCHAR2(32000 char);
    BEGIN
        IF p_prc_name    IS NULL
        THEN
            IF p_suitepath IS NOT NULL 
            THEN
                SELECT * bulk collect
                INTO l_test_result
                FROM TABLE(ut.run(ut_varchar2_list(p_pkg_name
                    ||':'
                    ||p_suitepath),ut_junit_reporter()));
            ELSE
                l_pkg_name :=REPLACE(p_pkg_name,':',',');
                SELECT * 
                bulk collect INTO l_test_result
                FROM TABLE(ut.run(ut_varchar2_list(l_pkg_name),ut_junit_reporter()));
            END IF;
        ELSE
            l_pkg_name := REPLACE(p_prc_name,':',',');
            SELECT * bulk collect
            INTO l_test_result
            FROM TABLE(ut.run(ut_varchar2_list(l_pkg_name),ut_junit_reporter()));
        END IF;
        l_test_run_result_xml := trim(REPLACE(tab_to_string(l_test_result,''),'<?xml version="1.0"?>',''));
        RETURN l_test_run_result_xml;
    END run_tests;
    -- insert test results(XML format) into uta_test_run table
    PROCEDURE insert_test_run(
        p_test_output   IN      CLOB,
        p_test_run_id       OUT uta_test_run.id%type)
    AS
    BEGIN
        INSERT
        INTO uta_test_run (
            test_run_start_date,
            test_run_result_xml )
        VALUES (
            sysdate,
            p_test_output )
        RETURN id
        INTO p_test_run_id;
    END insert_test_run;
    -- derive required values from test run result
    PROCEDURE derive_test_run_details (
        p_test_run_id   IN      uta_test_run.id%type,
        p_total_tests       OUT uta_test_run.total_tests%type,
        p_disabled_tests    OUT uta_test_run.disabled_tests%type,
        p_errored_tests     OUT uta_test_run.errored_tests%type,
        p_failed_tests      OUT uta_test_run.failed_tests%type,
        p_duration_sec      OUT uta_test_run.duration_sec%type )
    AS
    BEGIN
        SELECT xt.*
        INTO p_total_tests,
          p_disabled_tests,
          p_errored_tests,
          p_failed_tests,
          p_duration_sec
        FROM uta_test_run uta_run,
          XMLTABLE('/testsuites' PASSING xmltype(uta_run.test_run_result_xml) 
                                 COLUMNS "total_tests" VARCHAR2(4) PATH '@tests', 
                                         "disabled_tests" VARCHAR2(4) PATH '@disabled', 
                                         "errored_tests" VARCHAR2(4) PATH '@errors', 
                                         "failed_tests" VARCHAR2(4) PATH '@failures', 
                                         "duration_sec" VARCHAR2(4) PATH '@time') xt
        WHERE uta_run.id =p_test_run_id ;
    END;
    -- update uta_test_run table with derived values
    PROCEDURE update_test_run(
        p_test_run_id       IN      uta_test_run.id%type,
        p_total_tests       IN      uta_test_run.total_tests%type,
        p_disabled_tests    IN      uta_test_run.disabled_tests%type,
        p_errored_tests     IN      uta_test_run.errored_tests%type,
        p_failed_tests      IN      uta_test_run.failed_tests%type,
        p_duration_sec      IN      uta_test_run.duration_sec%type)
    AS
        l_count NUMBER;
    BEGIN
        UPDATE uta_test_run
        SET test_run_end_date = sysdate,
          total_tests         =to_number(p_total_tests),
          disabled_tests      =to_number(p_disabled_tests),
          errored_tests       =to_number(p_errored_tests),
          failed_tests        =to_number(p_failed_tests),
          duration_sec        =p_duration_sec
        WHERE id              =p_test_run_id;
    END;
    -- insert test_suite and test case details into uta_test_suite, uta_test_case tables
    PROCEDURE ins_test_suite_and_case(
        p_testrun_id    IN      NUMBER)
    AS
        l_testsuite_id uta_test_suite.id%type;
        l_tsu_id uta_test_suite.id%type:=0;
        l_error_message  VARCHAR2(32000 char);
        l_pkg_name       VARCHAR2(32000 char);
        l_count NUMBER;
        CURSOR c_test_suite(p_test_run_id NUMBER)
        IS
            WITH xml_tab AS (
                SELECT  xmltype(uta_run.test_run_result_xml) AS xml,
                        id
                FROM uta_test_run uta_run
            )
            SELECT xt.package_path ,
                xt.parent ,
                SUM(xt.total_tests) total_tests ,
                MIN(xt.testsuite_id) testsuite_id ,
                SUM(xt.disabled_tests) disabled_tests ,
                SUM(xt.errored_tests) errored_tests ,
                SUM(xt.failed_tests) failed_tests ,
                xt.testsuite_name ,
                SUM(to_number(xt.duration_sec, '999999.999999')) duration_sec ,
                xt.system_out ,
                xt.system_err
            FROM xml_tab,
                XMLTABLE( ' for $i in $doc//testsuite       
                            let $j := $i/..      
                            return <res>               
                            <suitepath>{data($i/@package)}</suitepath>               
                            <parent>{data($j/@package)}</parent>               
                            <tests>{data($i/@tests)}</tests>               
                            <id>{data($i/@id)}</id>               
                            <disabled>{data($i/@disabled)}</disabled>               
                            <errors>{data($i/@errors)}</errors>               
                            <failures>{data($i/@failures)}</failures>               
                            <name>{data($i/@name)}</name>               
                            <time>{data($i/@time)}</time>               
                            <system-out>{data($i/system-out)}</system-out>               
                            <system-err>{data($i/system-err)}</system-err>             
                            </res>'    
                passing xml_tab.xml AS "doc" 
                COLUMNS "PACKAGE_PATH"  VARCHAR2(100 char) path '//suitepath', 
                      parent            VARCHAR2(100 char) path '//parent', 
                      "TOTAL_TESTS"     VARCHAR2(4 char) PATH '//tests', 
                      "TESTSUITE_ID"    VARCHAR2(255 char) PATH '//id', 
                      "DISABLED_TESTS"  VARCHAR2(4 char) PATH '//disabled', 
                      "ERRORED_TESTS"   VARCHAR2(4 char) PATH '//errors', 
                      "FAILED_TESTS"    VARCHAR2(4 char) PATH '//failures', 
                      "TESTSUITE_NAME"  VARCHAR2(255 char) PATH '//name', 
                      "DURATION_SEC"    VARCHAR2(255 char) PATH '//time', 
                      "SYSTEM_OUT"      VARCHAR2(255 char) PATH 'system-out', 
                      "SYSTEM_ERR"      VARCHAR2(255 char) PATH 'system-err' ) xt
            WHERE xml_tab.id= p_test_run_id  
            GROUP BY xt.package_path ,
                xt.parent ,
                xt.TESTSUITE_NAME ,
                xt.system_out ,
                xt.system_err
            ORDER BY testsuite_id;
        CURSOR c_test_case(p_test_suite_path VARCHAR2,p_test_run_id NUMBER)
        IS
            SELECT xt.*
            FROM uta_test_run uta_run,
                XMLTABLE('/testsuites/testsuite//testcase'
                PASSING xmltype(uta_run.test_run_result_xml) 
                COLUMNS "FAILURE_STATEMENT" VARCHAR2(255 char) PATH 'failure', 
                        "ERROR_STATEMENT"   VARCHAR2(255 char) PATH 'error', 
                        "SYSTEM_OUT"        VARCHAR2(4 char) PATH 'system-out', 
                        "SYSTEM_ERR"        VARCHAR2(255 char) PATH 'system-err', 
                        "TESTCASE_PATH"     VARCHAR2(255 char) PATH '@classname', 
                        "TESTCASE_NAME"     VARCHAR2(255 char) PATH '@name', 
                        "ASSERTIONS"        VARCHAR2(4 char) PATH '@assertions', 
                        "STATUS"            VARCHAR2(20 char) PATH '@status', 
                        "DURATION_SEC"      VARCHAR2(255 char) PATH '@time') xt
            WHERE uta_run.id     = p_test_run_id
            AND xt.TESTCASE_PATH =p_test_suite_path;
    BEGIN
        FOR tsu_rec IN c_test_suite(p_testrun_id)
        LOOP
            INSERT
                INTO uta_test_suite (
                    uta_test_run_id,
                    package_path,
                    testsuite_name,
                    testsuite_id,
                    total_tests,
                    disabled_tests,
                    errored_tests,
                    failed_tests,
                    duration_sec,
                    tsu_id )
                VALUES (
                    p_testrun_id,
                    tsu_rec.package_path,
                    tsu_rec.testsuite_name,
                    tsu_rec.testsuite_id,
                    to_number(tsu_rec.total_tests),
                    to_number(tsu_rec.disabled_tests),
                    to_number(tsu_rec.errored_tests),
                    to_number(tsu_rec.failed_tests),
                    tsu_rec.duration_sec,
                    l_tsu_id )
                RETURN id
                INTO l_testsuite_id;
            l_tsu_id :=l_testsuite_id;
            FOR tc_rec IN c_test_case ( tsu_rec.package_path,p_testrun_id )
            LOOP
                SELECT COUNT(*)
                INTO l_count
                FROM uta_test_case utc,
                     uta_test_suite uts
                WHERE utc.uta_test_suite_id =uts.id
                  AND uts.uta_test_run_id     =p_testrun_id
                  AND utc.testcase_path       = tc_rec.testcase_path
                  AND utc.testcase_name       =tc_rec.testcase_name;
                IF l_count                  =0 
                THEN
                    INSERT
                    INTO uta_test_case (
                        uta_test_suite_id,
                        testcase_path,
                        testcase_name,
                        assertions,
                        test_status,
                        FAILURE_STATEMENT,
                        ERROR_STATEMENT,
                        SYSTEM_OUT,
                        SYSTEM_ERR,
                        duration_sec ,
                        executed_on )
                    VALUES (
                        l_testsuite_id,
                        tc_rec.testcase_path,
                        tc_rec.testcase_name,
                        tc_rec.assertions,
                        tc_rec.status,
                        tc_rec.FAILURE_STATEMENT,
                        tc_rec.ERROR_STATEMENT,
                        tc_rec.SYSTEM_OUT,
                        tc_rec.SYSTEM_ERR,
                        tc_rec.duration_sec,
                        sysdate );
                END IF;
            END LOOP;
        END LOOP;
    EXCEPTION
    WHEN OTHERS THEN
        l_error_message := 'Error occured while inserting test result into uta_test_suite, uta_test_case tables'||' '|| l_pkg_name;
        raise;
    END ins_test_suite_and_case;
    -- Main Test run call for selected Packges or Procedures
    PROCEDURE uta_run (
        p_pkg_name      IN      VARCHAR2,
        P_prc_name      IN      VARCHAR2 DEFAULT NULL,
        p_owner         IN      VARCHAR2,
        p_errror_message    OUT VARCHAR2 )
    AS
        l_testrun_id uta_test_run.id%type;
        l_test_run_result_xml CLOB;
        l_total_tests    VARCHAR2(4 char);
        l_disabled_tests VARCHAR2(4 char);
        l_errored_tests  VARCHAR2(4 char);
        l_failed_tests   VARCHAR2(4 char);
        l_duration_sec   VARCHAR2(4 char);
        l_error_message  VARCHAR2(32000 char);
    BEGIN
        l_test_run_result_xml:= run_tests(p_pkg_name,p_prc_name,NULL);
        insert_test_run(l_test_run_result_xml,l_testrun_id);
        derive_test_run_details(l_testrun_id,l_total_tests, l_disabled_tests, l_errored_tests, l_failed_tests, l_duration_sec);
        update_test_run(l_testrun_id,l_total_tests, l_disabled_tests, l_errored_tests, l_failed_tests, l_duration_sec);
        ins_test_suite_and_case(l_testrun_id);
    EXCEPTION
    WHEN OTHERS THEN
        p_errror_message := l_error_message;
        RAISE;
    END;
    -- Main Test run call to execute all packages from given user and suitepath
    PROCEDURE uta_run_all (
        p_suite_path    IN      VARCHAR2 DEFAULT NULL,
        p_owner         IN      VARCHAR2,
        p_errror_message    OUT VARCHAR2 )
    AS
        l_testrun_id uta_test_run.id%type;
        l_test_run_result_xml CLOB;
        l_total_tests    VARCHAR2(4 char);
        l_disabled_tests VARCHAR2(4 char);
        l_errored_tests  VARCHAR2(4 char);
        l_failed_tests   VARCHAR2(4 char);
        l_duration_sec   VARCHAR2(4 char);
        l_error_message  VARCHAR2(32000 char);
    BEGIN
        l_test_run_result_xml:= run_tests(p_owner,NULL,p_suite_path);
        insert_test_run( l_test_run_result_xml,l_testrun_id);
        derive_test_run_details(l_testrun_id,l_total_tests, l_disabled_tests, l_errored_tests, l_failed_tests, l_duration_sec);
        update_test_run(l_testrun_id,l_total_tests, l_disabled_tests, l_errored_tests, l_failed_tests, l_duration_sec);
        ins_test_suite_and_case(l_testrun_id);
    EXCEPTION
    WHEN OTHERS THEN
        p_errror_message := l_error_message;
        RAISE;
    END;
    
    
    PROCEDURE check_tests (p_testrun_id uta_test_run.id%type)
    AS                
        l_total_tests    VARCHAR2(4 char);
        l_disabled_tests VARCHAR2(4 char);
        l_errored_tests  VARCHAR2(4 char);
        l_failed_tests   VARCHAR2(4 char);
        l_duration_sec   VARCHAR2(4 char);        
    BEGIN
        derive_test_run_details(p_testrun_id,l_total_tests, l_disabled_tests, l_errored_tests, l_failed_tests, l_duration_sec);
        update_test_run(p_testrun_id,l_total_tests, l_disabled_tests, l_errored_tests, l_failed_tests, l_duration_sec);
        ins_test_suite_and_case(p_testrun_id);    
    END;
END uta_run_api;
/