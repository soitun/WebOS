<!---\\ This File Initiate all queries for the website //--->
<cfinclude template="webos_tables.cfm">
<!---\\Get Installed Modules //--->
<cfquery name="main_modules" datasource="#datasrc#">
select * from #table_mods# where module_installed ='1' Order BY module_id ASC      
</cfquery>
<!---\\End of Installed Modules//--->

<!---\\Get Left Sideboxes //--->
<cfquery name="left_boxes" datasource="#datasrc#">
select * from #table_sideboxes# where side_box_active ='1' and side_box_column='left' Order BY side_box_position ASC      
</cfquery>
<!---\\Get Right SideBoxes//--->
<cfquery name="right_boxes" datasource="#datasrc#">
select * from #table_sideboxes# where side_box_active ='1' and side_box_column='right' Order BY side_box_position ASC      
</cfquery>
<!---\\Modules Queries//--->
<!---\\ Query for Main Page Contents//--->
<cfquery name="main_page_setup" datasource="#datasrc#">
SELECT * from #table_mainpage# WHERE main_page_expire_date >='#dateformat(now(), "MM/DD/YYYY")#'
</cfquery>   
<cfif main_page_setup.main_page_time_sensitive eq "1">
<cfquery name="mainpage_content" datasource="#datasrc#">
select * from #table_mainpage# where main_page_expire_date between '#dateformat(now(), "MM/DD/YYYY")#' and '#main_page_setup.main_page_expire_date#' and main_page_active='1'
</cfquery>
<cfelse>
<cfquery name="mainpage_content" datasource="#datasrc#">
select * from #table_mainpage# where main_page_active='1'
</cfquery>
</cfif>

<!---\\Query for Our Analytics//--->
<cfif module_analytics EQ "1">
<CFQUERY NAME="get_analytics" datasource="#datasrc#">
   SELECT analytics_key
   FROM    #table_analytics#
</CFQUERY>
</cfif>

<cfif module_banners EQ "1">
<!--- Start Query Banner DB --->
<cfquery datasource="#datasrc#" name="banner">
select * from #table_banners#
order by ID desc
</cfquery>
<!--- End Query Banner DB --->
</cfif>

<!---\\query for the Blog Box //--->
<cfif module_blog EQ "1">
<cfquery name="current_posts" datasource="#datasrc#">
select * from #table_blog#
</cfquery>
</cfif>

<!---\\Query for Our Articles //--->
<cfif module_articles EQ "1">
<Cfquery name="GetArticles" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state, article_active, article_premium 
from #table_articles# where article_active ='1' order by article_create_date desc
</CFQUERY>
<cfif isDefined('url.module') and #url.module# EQ "articles">
<cfif isDefined('url.article_id') and #url.article_id# NEQ "">
<Cfquery name="Selected_Article" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state, article_premium from #table_articles# where article_id ='#url.article_id#'
 </CFQUERY>
 </cfif>

<!---\\ Viewing Archived Articles List //---> 
<Cfquery name="GetArticles_Archived" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state, article_active 
from #table_articles# where article_archived ='1' order by article_create_date desc
</CFQUERY>
<!---\\ Reading Archived Article //--->
<cfif isDefined('url.archive_id') and #url.archive_id# NEQ "">
<Cfquery name="Archived_Article" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state from #table_articles# where article_id ='#url.archive_id#' and article_archived ='1'
 </CFQUERY>
 </cfif>
</cfif>
<!---\\ For the Archives Column Box //--->
<Cfquery name="GetArticles_Archived" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state, article_active 
from #table_articles# where article_archived ='1' order by article_create_date desc
</CFQUERY>
</cfif>

<!---\\Query for Newsletter Archives//--->
<cfif module_newsletter EQ "1">

<!---\\Reading Archived Newsletter//--->
<cfif isDefined('url.newsletter_id') and #url.newsletter_id# NEQ "">
<Cfquery name="Archived_Newsletter" datasource="#datasrc#">
Select newsletter_id, newsletter_title, newsletter_content, date_sent from #table_newsletters_arch# where newsletter_id ='#url.newsletter_id#'
 </CFQUERY>
 </cfif>
</cfif>

<!---\\Query for Inquiry Form//--->
<cfif module_inquiry EQ "1">
<!---\\ Gathers Company Info //--->
<cfquery name="company_info" datasource="#datasrc#">
select * from #table_company_nfo#
</cfquery>
<!---\\Gets Company Hours//--->
<cfquery name="company_hours" datasource="#datasrc#">
select * from #table_company_hrs#
</cfquery>
<!---\\Gets Form Fields//--->
<cfquery name="inquiry_fields" datasource="#datasrc#" maxrows="15">
select * from #table_inquiry# where display_field='1'
</cfquery>
</cfif>

<!---\\Query for Our Did You knows//--->
<cfif module_didyouknow EQ "1">
<CFQUERY NAME="con_dyks" datasource="#datasrc#">
   SELECT * FROM    #table_dyk_content#
</CFQUERY>
<!---\\ For dyks that are displayed everywhere //--->
<CFQUERY NAME="get_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='1' ORDER BY NEWID()
</CFQUERY>

<!---\\ For DYKs that are displayed on pages //--->
<CFQUERY NAME="get_page_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='2' ORDER BY NEWID()
</CFQUERY>

<!---\\ For DYKs that are displayed on articles //--->
<CFQUERY NAME="get_article_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='3' ORDER BY NEWID()
</CFQUERY>

<!---\\ For DYKs that are displayed on pages & articles feeds //--->
<CFQUERY NAME="get_pagart_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='4' ORDER BY NEWID()
</CFQUERY>

<!---\\ For DYKs that are displayed on pages & articles feeds //--->
<CFQUERY NAME="get_rss_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='5' ORDER BY NEWID()
</CFQUERY>
</cfif>

<!---\\Query for SiteSearch//--->
<cfif module_sitesearch EQ "1">
<CFQUERY NAME="search_config" datasource="#datasrc#" maxrows="100">
   SELECT * FROM  #table_site_search# 
</CFQUERY>
</cfif>

<!---\\Query for Our WebSite Pages//--->
<cfif module_pages EQ "1">
    <!---\\ This Query is for the Pages Menu in either the Left or Right Column //--->
<CFQUERY NAME="pages_menu" datasource="#datasrc#">
   SELECT * FROM  #table_pages# where page_status ='1' and page_in_menu ='1'
</CFQUERY>
    
</cfif>

<!---\\Query for Website's Spotlights//--->
<cfif module_spotlights EQ "1">
<cfquery name="spotlight_setup" datasource="#datasrc#">
SELECT TOP 4 spotlight_time_sensitive, spotlight_start, spotlight_expire from #table_spots# WHERE spotlight_expire >='#dateformat(now(), "MM/DD/YYYY")#'
</cfquery>   

<cfif spotlight_setup.spotlight_time_sensitive eq "1">
<cfquery name="getspots" datasource="#datasrc#">
SELECT TOP 4 spotlight_id, spotlight_title, spotlight_description,  spotlight_time_sensitive, spotlight_starts, spotlight_expires
FROM #table_spots# WHERE spotlight_expires between '#dateformat(now(), "MM/DD/YYYY")#' and '#spotlight_setup.spotlight_expires#'
<!--- When running this live change: spotlight_domain = 'financialplannernetwork.com'--->
ORDER BY NEWID()    
</cfquery>
<cfelse>         
<cfquery name="getspots" datasource="#datasrc#">
SELECT TOP 4 spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive FROM #table_spots#
ORDER BY NEWID()    
</cfquery>
</cfif>
           
</cfif>

<!---\\Query for Our RSS FEEDS//--->
<cfif module_rss EQ "1">
<CFQUERY NAME="rss_config" datasource="#datasrc#">
   SELECT *
   FROM    #table_rss_conf#
</CFQUERY>

<CFQUERY NAME="get_rss" datasource="#datasrc#">
   SELECT <cfif #rss_config.randomize_feeds# eq "1"> Top #rss_config.random_feed_value# <cfelseif #rss_config.randomize_feeds# eq "0">*</cfif>
   FROM    #table_rss#
   WHERE  rss_status = <cfqueryparam cfsqltype="CF_SQL_INTEGER" null="no" value="1">
   ORDER   BY rss_weight ASC
</CFQUERY>

<CFQUERY NAME="get_our_rss" datasource="#datasrc#">
   SELECT * FROM    #table_our_feeds#
   WHERE  rss_status = '1'
   ORDER   BY rss_weight ASC
</CFQUERY>
</cfif>

<!---\\Query for Sitemap//--->


<!---\\End of Modules Queries//--->