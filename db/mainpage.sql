CREATE TABLE webos_mainpage(
main_page_id int IDENTITY(1,1) NOT NULL,
main_page_title varchar(50) NULL,
main_page_content varchar(8000) NULL,
main_page_time_sensitive int NULL,
main_page_start_date datetime NULL,
main_page_expire_date datetime NULL,
main_page_active int NULL)