<cfif isdefined('url.cat') and url.cat NEQ "Home">
    <!---Loads the Podcasts List--->
    <cfquery name="pod_cast_list" datasource="#datasrc#">
select * from #table_pods# where pod_cast_category='#url.cat#' AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
    </cfquery>
    <cfelseif isDefined('url.cat') and url.cat EQ "Home">
     <!---Loads the Podcasts List--->
    <cfquery name="pod_cast_list" datasource="#datasrc#">
    select * from #table_pods#   AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
    </cfquery>
    <cfelseif NOT isdefined('url.cat')>
     <cfquery name="pod_cast_list" datasource="#datasrc#">
    select * from #table_pods#   AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
    </cfquery>
    </cfif>
    <cfquery name="pod_cast_cats" datasource="#datasrc#">
    select * from #table_pod_cats# AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
    </cfquery>