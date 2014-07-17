CREATE TABLE webos_didyouknows(
	dyk_id int IDENTITY(1,1) NOT NULL,
	dyk_title varchar(50) NULL,
	dyk_content varchar(1000) NULL,
	dyk_views int NULL,
	dyk_available int NULL
)