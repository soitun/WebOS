CREATE TABLE webos_articles(
article_id int IDENTITY(1,1) NOT NULL,
article_title varchar(350) NULL,
article_description text NULL,
article_source varchar(150) NULL,
article_create_date datetime NULL,
article_content_state varchar(50) NULL,
article_active int NULL,
article_archived int NULL,
article_premium int NULL
)