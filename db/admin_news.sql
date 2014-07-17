CREATE TABLE webos_admin_news(
news_id int IDENTITY(1,1) NOT NULL,
news_title varchar(350) NULL,
news_content text NULL,
news_date datetime NULL
)