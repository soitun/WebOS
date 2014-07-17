CREATE TABLE webos_modules(
module_id int IDENTITY(1,1) NOT NULL,
module_name varchar(50) NULL,
module_description varchar(255) NULL,
module_installed int NULL,
module_weight int NULL,
module_column varchar(50) NULL,
module_directory varchar(50) NULL,
module_admin int NULL)