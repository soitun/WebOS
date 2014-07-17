<cfquery name="current_posts" datasource="#datasrc#">
select * from #table_blog# where SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>