CREATE TABLE webos_newsletters_archives(
newsletter_id int IDENTITY(1,1) NOT NULL,
newsletter_title varchar(350) NULL,
newsletter_content text NULL,
date_sent datetime NOT NULL CONSTRAINT DF_webos_newsletters_archives_date_sent  DEFAULT (getdate()))

CREATE TABLE webos_newsletters(newsletteruserid int IDENTITY(1,1) NOT NULL,
userid varchar(50) NULL,
firstname varchar(250) NULL,
lastname varchar(250) NULL,
email varchar(250) NULL,
emailtype int NULL CONSTRAINT DF_webos_newsletters_emailtype  DEFAULT ((0))) 