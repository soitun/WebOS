IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_admin_news') AND type in (N,'U'))
DROP TABLE webos_admin_news

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_admins') AND type in (N,'U'))
DROP TABLE webos_admins

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_analytics') AND type in (N,'U'))
DROP TABLE webos_analytics

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_articles') AND type in (N,'U'))
DROP TABLE webos_articles

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_banners') AND type in (N,'U'))
DROP TABLE webos_banners

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_blog_blog_tbl') AND type in (N,'U'))
DROP TABLE webos_blog_blog_tbl

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_blog_cat_tbl') AND type in (N,'U'))
DROP TABLE webos_blog_cat_tbl

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_blog_comment_tbl') AND type in (N,'U'))
DROP TABLE webos_blog_comment_tbl

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_blog_config') AND type in (N,'U'))
DROP TABLE webos_blog_config

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_blog_newsletter_tbl') AND type in (N,'U'))
DROP TABLE webos_blog_newsletter_tbl

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_blog_users_tbl') AND type in (N,'U'))
DROP TABLE webos_blog_users_tbl

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_chat_cats') AND type in (N,'U'))
DROP TABLE webos_chat_cats

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_chat_chats') AND type in (N,'U'))
DROP TABLE webos_chat_chats

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_chat_chat_users') AND type in (N,'U'))
DROP TABLE webos_chat_chatusers

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_chat_online') AND type in (N,'U'))
DROP TABLE webos_chat_online

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_chat_prichat') AND type in (N,'U'))
DROP TABLE webos_chat_prichat

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_company_hours') AND type in (N,'U'))
DROP TABLE webos_company_hours

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_company_info') AND type in (N,'U'))
DROP TABLE webos_company_info

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_config') AND type in (N,'U'))
DROP TABLE webos_config

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_dyk_content') AND type in (N,'U'))
DROP TABLE webos_dyk_content

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_conferences') AND type in (N,'U'))
DROP TABLE webos_forum_conferences

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_custom_nav') AND type in (N,'U'))
DROP TABLE webos_forum_custom_nav

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_forums') AND type in (N,'U'))
DROP TABLE webos_forum_forums

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_messages') AND type in (N,'U'))
DROP TABLE webos_forum_messages

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_moderators') AND type in (N,'U'))
DROP TABLE webos_forum_moderators

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_notifications') AND type in (N,'U'))
DROP TABLE webos_forum_notifications

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_page_content') AND type in (N,'U'))
DROP TABLE webos_forum_page_content

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_pages') AND type in (N,'U'))
DROP TABLE webos_forum_pages

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_privatemessages') AND type in (N,'U'))
DROP TABLE webos_forum_privatemessages

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_ranks') AND type in (N,'U'))
DROP TABLE webos_forum_ranks

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_search_log') AND type in (N,'U'))
DROP TABLE webos_forum_search_log

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_sessions') AND type in (N,'U'))
DROP TABLE webos_forum_sessions

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_settings') AND type in (N,'U'))
DROP TABLE webos_forum_settings

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_subscriptions') AND type in (N,'U'))
DROP TABLE webos_forum_subscriptions

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_threads') AND type in (N,'U'))
DROP TABLE webos_forum_threads

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_forum_usergroup_members') AND type in (N,'U'))
DROP TABLE webos_forum_usergroup_members

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_usergroups') AND type in (N,'U'))
DROP TABLE webos_forum_usergroups

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_inquiry') AND type in (N,'U'))
DROP TABLE webos_inquiry

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_inquiry_selects') AND type in (N,'U'))
DROP TABLE webos_inquiry_selects

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_links') AND type in (N,'U'))
DROP TABLE webos_links

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_links_cat') AND type in (N,'U'))
DROP TABLE webos_links_cat

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_mainpage') AND type in (N,'U'))
DROP TABLE webos_mainpage

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_metatags') AND type in (N,'U'))
DROP TABLE webos_metatags

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_modules') AND type in (N,'U'))
DROP TABLE webos_modules

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_newsletters') AND type in (N,'U'))
DROP TABLE webos_newsletters

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_newsletters_archive') AND type in (N,'U'))
DROP TABLE webos_newsletters_archives

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_our_rss_feeds') AND type in (N,'U'))
DROP TABLE webos_our_rss_feeds

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_pages') AND type in (N,'U'))
DROP TABLE webos_pages

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_podcast_categories') AND type in (N,'U'))
DROP TABLE webos_podcast_categories

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_podcasts') AND type in (N,'U'))
DROP TABLE webos_podcasts

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_poll_answers') AND type in (N,'U'))
DROP TABLE webos_poll_answers

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_poll_questions') AND type in (N,'U'))
DROP TABLE webos_poll_questions

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_rss_config') AND type in (N,'U'))
DROP TABLE webos_rss_config

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_rss_feeds') AND type in (N,'U'))
DROP TABLE webos_rss_feeds

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_sitesearch') AND type in (N,'U'))
DROP TABLE webos_sitesearch

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_spotlights') AND type in (N,'U'))
DROP TABLE webos_spotlights

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N,'webos_users') AND type in (N,'U'))
DROP TABLE webos_users