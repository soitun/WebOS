<CFQUERY NAME="search_config" datasource="#datasrc#" maxrows="100">
   SELECT * FROM  #table_site_search#  WHERE SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</CFQUERY>