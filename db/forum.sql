CREATE TABLE webos_forum_entries(
	EntryID int IDENTITY(1,1) NOT NULL,
	RoomID int NULL,
	PostNum int NULL,
	Thread int NULL,
	ThreadCount int NULL,
	CreateDate datetime NULL,
	Author varchar(550) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Email varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Title varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Message text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ThreadEnd bit NULL
)

CREATE TABLE webos_forum_rooms(
	RoomId int IDENTITY(1,1) NOT NULL,
	Title varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Active int NULL,
	Threads int NULL
)

CREATE TABLE webos_forum_ranks(
	RankID int NULL,
	Rank_Title varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Posts int NULL
)

CREATE TABLE webos_forum_subscriptions(
	SubscriptionID int NULL,
	UserID int NULL,
	RoomID int NULL,
	Room_Name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)