<!---
	Name         : feed.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 03, 2007
	History      : Version 1.0
--->
<cfsetting enablecfoutputonly="yes"> 
<cfif not isDefined("URL.cat")>
	<cfset URL.cat = "">
</cfif>
		<cfif application.dbType is "mysql">
<cfoutput>Feed does not support MySQL</cfoutput>
		<cfelse>
			<cfquery datasource="#datasrc#" name="get_feed">
				SELECT TOP #application.feedAmount# *
				FROM blog_tbl
				<cfif URL.cat IS NOT "">
					WHERE bl.blCategory = '#URL.cat#'
                    AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
				</cfif>
                WHERE SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
				ORDER BY blID DESC
			</cfquery>
		<cfsavecontent variable="theXML">
	<cfoutput><?xml version="1.0" encoding="ISO-8859-1" ?>
		<!-- RSS generated by #application.siteTitle# on #now()# -->
		<rss version="2.0">
		<channel>
		<title>#application.siteTitle#</title>
		<link>#application.siteAddress#</link>
		<description>#application.siteDescription#</description>
		<language>en-us</language>
		<copyright>Copyright  #application.thisYear# #application.siteTitle#</copyright>
		<docs>#application.siteAddress#feed.xml</docs>
		<lastBuildDate>#dateformat(now(), "ddd, dd mmm yyyy")# #timeformat(now(), "HH:mm:ss")# MST</lastBuildDate>
		<image>
		<title>#application.siteTitle#</title>
		<url>#application.siteAddress#</url>
		<link>#application.siteAddress#</link>
		</image>
		</cfoutput>
		
		<cfloop from ="1" to="#get_feed.RecordCount#" index="ctr">
		<cfscript>
		title = replace(get_feed.blTitle[ctr], "<", "&lt;", "ALL");

       	description = replace(get_feed.blText[ctr], "&", "&amp;", "ALL");
		description = replace(description, "<", "&lt;", "ALL");
       	description = replace(description, ">", "&gt;", "ALL");

       	description = replace(description, '"', "'", "ALL");
		date = dateformat(get_feed.blDate[ctr], "ddd, dd mmm yyyy");
		time = timeformat(get_feed.blDate[ctr], "HH:mm:sss") & " MST";
		</cfscript>
		<cfoutput>
		<item>
		<title>#get_feed.blTitle[ctr]#</title>
		<description>#description#</description>
		<link>#application.siteAddress#index.cfm/dopost/yes/id/#get_feed.blID[ctr]#</link>
		<aurthor>#application.siteEmail# (#application.siteAurthor#)</aurthor>
		<pubDate>#date# #time#</pubDate>
</item>
   </cfoutput>
</cfloop>
<cfoutput>
</channel>
</rss>
</cfoutput>
</cfsavecontent>
		
<cffile action="write" file="#application.sitePath#feed.xml" output="#theXml#">

<cfcontent type="text/xml">
<cfoutput>#theXml#</cfoutput>
		</cfif>