CREATE TABLE webos_podcasts(
pod_cast_id int IDENTITY(1,1) NOT NULL,
pod_cast_filename varchar(255) NULL,
pod_cast_filesize varchar(50) NULL,
pod_cast_title varchar(255) NULL,
pod_cast_playtime varchar(50) NULL,
pod_cast_description varchar(255) NULL,
pod_cast_category int NULL) 

CREATE TABLE webos_podcast_categories(
pod_cast_catid int IDENTITY(1,1) NOT NULL,
pod_cast_category_name varchar(255) NULL)