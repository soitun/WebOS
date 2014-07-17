<CFQUERY NAME="get_analytics" datasource="#datasrc#">
   SELECT analytics_key
   FROM    #table_analytics# WHERE SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</CFQUERY>