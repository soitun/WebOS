CREATE TABLE webos_inquiry_subjects(
   subject_id int IDENTITY(1,1) NOT NULL,
   subject varchar(550) NULL
)

CREATE TABLE webos_inquiry_submitted(
   inquiry_id int IDENTITY(1,1) NOT NULL,
   subject varchar(350) NULL,
   field_001 text NULL,
   field_002 text NULL,
   field_003 text NULL,
   field_004 text NULL,
   field_005 text NULL,
   field_006 text NULL,
   field_007 text NULL,
   field_008 text NULL,
   field_009 text NULL,
   field_010 text NULL,
   field_011 text NULL,
   field_012 text NULL,
   field_013 text NULL,
   field_014 text NULL,
   field_015 text NULL,
   date_submitted datetime NULL,
   replied_to int NULL
)
CREATE TABLE webos_inquiry(
   field_id int IDENTITY(1,1) NOT NULL,
   display_name varchar(50) NULL,
   field_name varchar(50) NULL,
   field_type varchar(50) NULL,
   field_group text NULL,
   field_value varchar(50) NULL,
   field_option varchar(50) NULL,
   field_selected int NULL,
   field_required int NULL,
   display_field int NULL
)

CREATE TABLE webos_inquiry_selects(
   field_id int NULL,
   field_option varchar(50) NULL,
   field_option_value varchar(50) NULL,
   field_selected int NULL
)