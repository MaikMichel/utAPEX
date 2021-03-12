  CREATE OR REPLACE EDITIONABLE PACKAGE uta_run_api 
IS
    /**
    *Inserts a Test run Details into the tables uta_test_run, uta_test_suite, uta_test_case<br><br>
    *@author 03.01.2019 | Swathi Ambati, Maik Becker | Created
    *@param P_pkg_name       VARCHAR2
    *@param P_prc_name       VARCHAR2
    *@param p_owner          VARCHAR2
    *@param p_errror_message VARCHAR2
    */
    PROCEDURE uta_run(
        p_pkg_name          IN      VARCHAR2,
        P_prc_name          IN      VARCHAR2 DEFAULT NULL,
        p_owner             IN      VARCHAR2,
        p_errror_message        OUT VARCHAR2);
	 
    /**
    *<br><b>Description:</b><br><br>
    *Inserts a Test run Details into the tables uta_test_run, uta_test_suite, uta_test_case<br><br>
    *@author 03.01.2019 | Swathi Ambati, Maik Becker | Created
    *@param p_owner            VARCHAR2
    *@param p_suitepath        VARCHAR2
    *@param p_errror_message   VARCHAR2
    */
    PROCEDURE uta_run_all(
        p_suite_path    IN      VARCHAR2 DEFAULT NULL,
        p_owner         IN      VARCHAR2,
        p_errror_message    OUT VARCHAR2);
        
    PROCEDURE check_tests (p_testrun_id uta_test_run.id%type);   
END uta_run_api;
/