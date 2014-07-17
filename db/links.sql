CREATE TABLE webos_links_cat(
link_cat_id int IDENTITY(1,1) NOT NULL,
link_cat_parent int NULL,
link_cat_title varchar(850) NOT NULL CONSTRAINT DF__webos_lin__link___1BFD2C07  DEFAULT (''),
link_cat_description varchar(850) NULL,
link_cat_img varchar(50) NULL,
link_cat_links int NULL CONSTRAINT DF_webos_links_cat_link_cat_links  DEFAULT ((0)),
CONSTRAINT PK__webos_links_cat__1B0907CE PRIMARY KEY CLUSTERED (link_cat_id ASC) )

CREATE TABLE webos_links(
link_id int IDENTITY(1,1) NOT NULL,
link_cat int NOT NULL CONSTRAINT DF__webos_lin__link___15502E78  DEFAULT (''),
link text NOT NULL CONSTRAINT DF__webos_link__link__164452B1  DEFAULT (''),
link_title varchar(300) NOT NULL CONSTRAINT DF__webos_lin__short__173876EA  DEFAULT (''),
link_desc varchar(350) NULL,
link_img varchar(50) NULL,
visits int NOT NULL CONSTRAINT DF__webos_lin__visit__1920BF5C  DEFAULT ((0)),
CONSTRAINT PK__webos_links__145C0A3F PRIMARY KEY CLUSTERED (link_id ASC) )