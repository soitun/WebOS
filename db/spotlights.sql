CREATE TABLE webos_spotlights(
spotlight_id int IDENTITY(1,1) NOT NULL,
spotlight_title varchar(350) NULL,
spotlight_description text NULL,
spotlight_time_sensitive int NULL,
spotlight_start datetime NULL,
spotlight_expire datetime NULL)