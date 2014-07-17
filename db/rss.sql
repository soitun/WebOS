CREATE TABLE webos_our_rss_feeds(
rss_id int IDENTITY(1,1) NOT NULL,
rss_title varchar(350) NULL,
rss_content text NULL,
rss_created datetime NULL,
rss_author varchar(50) NULL,
rss_author_email varchar(50) NULL,
rss_status int NULL,
rss_weight int NULL)

CREATE TABLE webos_rss_config(
rss_config_id int IDENTITY(1,1) NOT NULL,
randomize_feeds int NULL,
random_feed_value int NULL) 

CREATE TABLE webos_rss_feeds(
rss_id int IDENTITY(1,1) NOT NULL,
rss_title varchar(1500) NULL,
rss_content varchar(1500) NULL CONSTRAINT DF__webos_rss__rss_c__24927208  DEFAULT (''),
rss_status int NULL CONSTRAINT DF__webos_rss__rss_s__25869641  DEFAULT (''),
rss_weight int NULL CONSTRAINT DF__webos_rss__weigh__267ABA7A  DEFAULT ((0)),
PRIMARY KEY CLUSTERED (rss_id ASC) )