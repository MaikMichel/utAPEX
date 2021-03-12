  alter table uta_test_suite add constraint uta_test_suit_uta_test_run_fk foreign key (uta_test_run_id)
	  references uta_test_run (id) on delete cascade enable;