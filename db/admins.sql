CREATE TABLE webos_admins(
userid int IDENTITY(1,1) NOT NULL,
username varchar(50) NULL,
password varchar(50) NULL,
name varchar(150) NULL,
permissions int NULL
)