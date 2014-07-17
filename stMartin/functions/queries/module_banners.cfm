<!---
 Mod By : AP
 Mod : SiteID to Query's Where Clause--->
<cfquery datasource="#datasrc#" name="banner">
select * from #table_banners#
WHERE SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
order by ID desc
</cfquery>