<!---\\ Runs an Database Query to find, retrieve and set Site Configurables //--->
<cfquery name="site_config" datasource="#datasrc#">
select * from #table_config# 
WHERE SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>

<cfquery name="core_config" datasource="#datasrc#">
select * from #table_config# where configuration_group ='CORE'
AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>

<cfquery name="system_config" datasource="#datasrc#">
select * from #table_config# where configuration_group ='SYSTEM'
AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>

<cfquery name="template_config" datasource="#datasrc#">
select * from #table_config# where configuration_group ='TEMPLATES'
AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>

<cfquery name="module_config" datasource="#datasrc#">
select * from #table_mods#
WHERE SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</cfquery>