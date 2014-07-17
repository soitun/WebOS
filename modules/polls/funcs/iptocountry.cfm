<cfsilent>
<!---/// 

Ip to Country
=============

By: Tony Petruzzi (tonyp@rolist.com)
Revision: 07222004

SHAMLESS PLUG
=============
check out http://www.bannerboxes.com   :)

DESCRIPTION
===========

This uses the application scope to store the Ip to Country CSV file from
http://ip-to-country.webhosting.info/ into the application scope so
that you can determine which country your visitor has come from. Make sure
that the file ip-to-country.csv is in the directory that this tag is in.

NOTE: Although this custom tag will work with CF5, it will be SLOW AS HELL.
I did some testing and on CF5 the query of queries takes between 2 - 2.5
seconds. On CFMX 6.1 (Redsky) this takes less than 100 milliseconds.

This tag will take a while the first time it is run since it will load the
csv file into memory. After that, it is fast.

PARAMETERS:
===========

ipaddress -  a valid ipaddress (optional)

NOTE: you can either pass an ipaddress directly to the tag through the attributes scope or
it will look in the URL and FORM structures for a variable named ipaddress. If it doesn't
find an ipaddress variable in the ATTRIBUTES, URL or FORM structure, then it will use
CGI.REMOTE_ADDR for the ipaddress.

RETURNS:
========

iptocountry - a structure containing the country information (full name, 2 letter abbr and 3 letter abbr) and the ipaddress that was searched.

 ///--->
 
<!---/// incase ipaddress is passed to the custom tag ///--->
<cfset QuestionID = "#url.QID#">
<cfparam name="attributes.ipaddress" default="">
<!---/// this is so the tag with grab the ipaddress from the url or form structures ///--->
<cfparam name="ipaddress" default="">

<!---/// Load the database into the application scope for faster processing ///--->
<cfif NOT isdefined("application.IpToCountryDatabase")>

	<!---/// Read the CSV file and load into memory ///--->
	<cffile action="READ" file="#GetDirectoryFromPath(GetCurrentTemplatePath())#\ip-to-country.csv" variable="variables.temp">
	
	<!---/// Parse the CSV file and load into the query variable ///--->
	<cfscript>
	// convert the list into an array
	variables.temp = ListToArray(variables.temp, "#chr(10)##chr(13)#");
	// create query object to hold database
	variables.iptocountry = QueryNew("beginip,endip,country_fullname,country_abbr2,country_abbr3");
	// pre populate the query object with the number of row we need.
	QueryAddRow(variables.iptocountry, ArrayLen(variables.temp));
	for(i=1; i LTE ArrayLen(variables.temp); i=i+1){
		variables.iptocountry["beginip"][i] = Replace(GetToken(variables.temp[i], 1, ","), '"', "", "ALL");
		variables.iptocountry["endip"][i] = Replace(GetToken(variables.temp[i], 2, ","), '"', "", "ALL");
		variables.iptocountry["country_abbr2"][i] = Replace(GetToken(variables.temp[i], 3, ","), '"', "", "ALL");
		variables.iptocountry["country_abbr3"][i] = Replace(GetToken(variables.temp[i], 4, ","), '"', "", "ALL");
		variables.iptocountry["country_fullname"][i] = Replace(GetToken(variables.temp[i], 5, ","), '"', "", "ALL");
	}	
	</cfscript>
	
	<cflock timeout="0" throwontimeout="No" name="IpToCountryDatabase" type="EXCLUSIVE">
		<cfset application.IpToCountryDatabase = variables.iptocountry>
	</cflock>
	
</cfif>

<cfscript>
// Setup return structure
Caller.iptocountry = StructNew();
Caller.iptocountry.fullname = "";
Caller.iptocountry.abbr2 = "";
Caller.iptocountry.abbr3 = "";
Caller.iptocountry.ipaddress = "";

// if the didn't pass the ipaddress directly, check the url and form structures
if(attributes.ipaddress EQ ""){
	attributes.ipaddress = ipaddress;
}

// Still cannot find an ipaddress. Use CGI.REMOTE_ADDR
if(attributes.ipaddress EQ ""){
	attributes.ipaddress = CGI.REMOTE_ADDR;
}
</cfscript>

<!---/// Make sure that the ipaddress is valid ///--->
<cfif ReFindNoCase("^([0-9]{1,3}\.){3}[0-9]{1,3}$", attributes.ipaddress) EQ 0>
	<cfexit method="EXITTAG">
</cfif>

<!---/// Convert Ip Address into bigint for precoessing ///--->
<cfset variables.ipaddress2 = (ListGetAt(attributes.ipaddress, 1, '.') * 16777216) + (ListGetAt(attributes.ipaddress, 2, '.') * 65536) + (ListGetAt(attributes.ipaddress, 3, '.') * 256) + ListGetAt(attributes.ipaddress, 4, '.')>

<!---/// Grab the country that this ipaddress belongs to ///--->
<cfquery name="GrabCountry"
         dbtype="query">
SELECT
	country_fullname,
	country_abbr2,
	country_abbr3
FROM application.IpToCountryDatabase
WHERE <cfqueryparam value="#variables.ipaddress2#" cfsqltype="CF_SQL_BIGINT"> BETWEEN beginip AND endip
</cfquery>

<cfscript>
Caller.iptocountry.fullname = GrabCountry.country_fullname;
Caller.iptocountry.abbr2 = GrabCountry.country_abbr2;
Caller.iptocountry.abbr3 = GrabCountry.country_abbr3;
Caller.iptocountry.ipaddress = attributes.ipaddress;
</cfscript>
<CFSET host = cgi.remote_host>
<CFSET referer = cgi.http_referer>
<CFSET agent = cgi.http_user_agent>
<!---Begin the Stats Insertion Query--->
<cfif #Caller.iptocountry.fullname# eq "" >
<cfquery name="Poll_Stats" datasource="MassContent1">
Insert into poll_stats (poll_id, ipaddress, country, host, referrer, agent) Values ('#QuestionID#', '#Caller.iptocountry.ipaddress#', '-UnDefined or Unknown-', '#host#', '#referer#', '#agent#')
</cfquery>
<cfelse>
<cfquery name="Poll_Stats" datasource="MassContent1">
Insert into poll_stats (poll_id, ipaddress, country, host, referrer, agent) Values ('#QuestionID#', '#Caller.iptocountry.ipaddress#', '#Caller.iptocountry.fullname#', '#host#', '#referer#', '#agent#')
</cfquery>
</cfif>
<!---End the Stats insertion Query--->

</cfsilent>
