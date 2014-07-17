CREATE TABLE webos_blog_config(
blog_site_id int NOT NULL,
blog_site_domain varchar(50) NULL,
blog_site_template varchar(50) NULL,
CONSTRAINT PK_blog_config 
PRIMARY KEY CLUSTERED (blog_site_id ASC)
) 

CREATE TABLE webos_blog_blog(
blID int IDENTITY(1,1) NOT NULL,
blTitle nvarchar(50) NULL,
blDate datetime NULL CONSTRAINT DF_blog2_blDate  DEFAULT (getdate()),
blText text NULL,
blText2 text NULL,
blCategory nvarchar(50) NULL,
blLink nvarchar(50) NULL,
blView int NULL,
blPage bit NULL,
blUser nvarchar(50) NULL,
blDomain varchar(50) NULL
)

CREATE TABLE webos_blog_cat(
ctID int IDENTITY(1,1) NOT NULL,
ctCat nvarchar(50) NULL,
ctDomain varchar(50) NULL
) 

CREATE TABLE webos_blog_comment(
cID int IDENTITY(1,1) NOT NULL,
cbid int NULL,
cName nvarchar(50) NULL,
cLink nvarchar(50) NULL,
cEmail nvarchar(50) NULL,
cCom text NULL,
cDate datetime NULL CONSTRAINT DF_comment2_cDate  DEFAULT (getdate()),
cStatus bit NULL,
cSubscribe bit NULL,
cDomain varchar(50) NULL
) 

CREATE TABLE webos_blog_newsletter(
neID int IDENTITY(1,1) NOT NULL,
neEmail nvarchar(50) NULL,
neToken nvarchar(50) NULL,
neStatus bit NULL,
neDomain varchar(50) NULL
) 

CREATE TABLE webos_blog_users(
utUserId int IDENTITY(1,1) NOT NULL,
utUserName nvarchar(50) NULL,
utUserPass nvarchar(50) NULL,
utFirstName nvarchar(50) NULL,
utLastName nvarchar(50) NULL,
utDomain varchar(50) NULL ) 