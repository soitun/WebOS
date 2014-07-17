CREATE TABLE webos_config(
	configuration_id int IDENTITY(1,1) NOT NULL,
	configuration_title varchar(50)  NULL,
	configuration_key varchar(250)  NULL,
	configuration_value varchar(255)  NULL,
	configuration_description varchar(500)  NULL,
	configuration_group varchar(50)  NULL,
	weight int NULL,
	last_modified datetime NULL
)

CREATE TABLE webos_config_sidebox(
	side_box_id int IDENTITY(1,1) NOT NULL,
	side_box_name varchar(50)  NULL,
	side_box_filename varchar(50)  NULL,
	side_box_column varchar(50)  NULL,
	side_box_active int NULL,
	side_box_position int NULL
)


CREATE TABLE webos_company_info(
	company_name varchar(50) NULL,
	company_address varchar(50) NULL,
	company_address_2 varchar(50) NULL,
	company_tollfree varchar(50) NULL,
	company_phone varchar(50) NULL,
	company_fax varchar(50) NULL,
	company_city varchar(50) NULL,
	company_state varchar(50) NULL,
	company_zip varchar(50) NULL
)
CREATE TABLE webos_company_hours(
	hours_monday varchar(50) NULL,
	hours_tuesday varchar(50) NULL,
	hours_wednesday varchar(50) NULL,
	hours_thursday varchar(50) NULL,
	hours_friday varchar(50) NULL,
	hours_saturday varchar(50) NULL,
	hours_sunday varchar(50) NULL
)



