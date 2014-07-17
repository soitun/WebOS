CREATE TABLE webos_banners(
	ID int IDENTITY(1,1) NOT NULL,
	Banner_Alt text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Banner_Company varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Banner_Pic text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Banner_Url text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Ban_Clicks int NULL,
	Ban_Views int NULL,
	Banner_weight int NULL
)