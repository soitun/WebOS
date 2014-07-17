CREATE TABLE webos_chat_cats(
chatcat int IDENTITY(1,1) NOT NULL,
topic varchar(50) NULL,
description text NULL) 

CREATE TABLE webos_chat_chatusers(
userid int IDENTITY(1,1) NOT NULL,
FirstName varchar(150) NULL,
LastName varchar(150) NULL,
company varchar(150) NULL,
email varchar(150) NULL,
url varchar(250) NULL,
Username varchar(150) NULL,
password varchar(50) NULL,
profile text NULL)

CREATE TABLE webos_chat_online(
onlineid int IDENTITY(1,1) NOT NULL,
userid int NULL) 

CREATE TABLE webos_chat_prichat(
prichat int IDENTITY(1,1) NOT NULL,
chatcat int NULL,
userid int NULL,
touserid int NULL,
msg text NULL) 

CREATE TABLE webos_chat_chats(
chatid int IDENTITY(1,1) NOT NULL,
chatcat int NULL,
userid int NULL,
msg text NULL)