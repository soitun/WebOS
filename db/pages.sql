CREATE TABLE webos_pages(
page_id int IDENTITY(1,1) NOT NULL,
page_title varchar(150) NOT NULL CONSTRAINT DF__webos_pag__page___29572725  DEFAULT (''),
page_content text NOT NULL CONSTRAINT DF__webos_pag__page___2A4B4B5E  DEFAULT (''),
page_in_menu int NOT NULL CONSTRAINT DF__webos_pag__page___2B3F6F97  DEFAULT ((0)),
page_status int NOT NULL CONSTRAINT DF__webos_pag__page___2C3393D0  DEFAULT (''),
weight int NOT NULL CONSTRAINT DF__webos_pag__weigh__2D27B809  DEFAULT ((0)),
CONSTRAINT PK__webos_pages__286302EC PRIMARY KEY CLUSTERED (page_id ASC) ) 