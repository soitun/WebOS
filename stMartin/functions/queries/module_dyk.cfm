<!---
 Mod By : AP
 Mod : SiteID to Query's Where Clause--->
<CFQUERY NAME="con_dyks" datasource="#datasrc#">
   SELECT * FROM    #table_dyk_content#  WHERE  SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
</CFQUERY>
<!---\\ For dyks that are displayed everywhere //--->
<cfif #db_type# EQ "mssql">
<CFQUERY NAME="get_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='1' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY NEWID()
</CFQUERY>
<cfelseif #db_type# EQ "mysql">
<CFQUERY NAME="get_dyks" datasource="#datasrc#">
   SELECT * FROM #table_dyk_content# where dyk_available ='1' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY dyk_id Limit 5;
</CFQUERY>
</cfif>

<!---\\ For DYKs that are displayed on pages //--->
<cfif #db_type# EQ "mssql">
<CFQUERY NAME="get_page_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='2 AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">' ORDER BY NEWID()
</CFQUERY>
<cfelseif #db_type# EQ "mysql">
<CFQUERY NAME="get_page_dyks" datasource="#datasrc#">
   SELECT * FROM #table_dyk_content# where dyk_available ='2' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY dyk_id Limit 5
</CFQUERY>
</cfif>

<!---\\ For DYKs that are displayed on articles //--->
<cfif #db_type# EQ "mssql">
<CFQUERY NAME="get_article_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='3' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY NEWID()
</CFQUERY>
<cfelseif #db_type# EQ "mysql">
<CFQUERY NAME="get_article_dyks" datasource="#datasrc#">
   SELECT * FROM #table_dyk_content# where dyk_available ='3' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY dyk_id Limit 5
</CFQUERY>
</cfif>

<!---\\ For DYKs that are displayed on pages & articles feeds //--->
<cfif #db_type# EQ "mssql">
<CFQUERY NAME="get_pagart_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='4' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY NEWID()
</CFQUERY>
<cfelseif #db_type# EQ "mysql">
<CFQUERY NAME="get_pagart_dyks" datasource="#datasrc#">
   SELECT * FROM #table_dyk_content# where dyk_available ='4' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY dyk_id Limit 5
</CFQUERY>
</cfif>

<!---\\ For DYKs that are displayed on pages & articles feeds //--->
<cfif #db_type# EQ "mssql">
<CFQUERY NAME="get_rss_dyks" datasource="#datasrc#">
   SELECT TOP 5 * FROM #table_dyk_content# where dyk_available ='5' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY NEWID()
</CFQUERY>
<cfelseif #db_type# EQ "mysql">
<CFQUERY NAME="get_rss_dyks" datasource="#datasrc#">
   SELECT * FROM #table_dyk_content# where dyk_available ='5' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#"> ORDER BY dyk_id Limit 5
</CFQUERY>
</cfif>