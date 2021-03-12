  alter table uta_test_case add constraint uta_test_case_uta_test_suit_fk foreign key (uta_test_suite_id)
	  references uta_test_suite (id) on delete cascade enable;