<!---\\ Gathers Company Info //--->
<cfquery name="company_info" datasource="#datasrc#">
select * from #table_company_nfo# WHERE SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>
<!---\\Gets Company Hours//--->
<cfquery name="company_hours" datasource="#datasrc#">
select * from #table_company_hrs# WHERE SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>
<!---\\Gets Form Fields//--->
<cfquery name="inquiry_fields" datasource="#datasrc#" maxrows="15">
select * from #table_inquiry# where display_field='1' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>