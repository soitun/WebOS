<!---\\ Module Configuration //--->
<cfset module ="polls">
<!---\\ End of Module Configuration //---->
<!---<cfoutput>#site_modules_dir# | #site_template_dir#</cfoutput>--->
<style>

.pollstats {
border: 1px solid #333333;
}
.pollstats_header{
color: #10147f;
font-family:Verdana, Arial, Helvetica, sans-serif;
font-size: 10px;
}
.pollstats_results{
color: #000000;
font-family:Verdana, Arial, Helvetica, sans-serif;
font-size: 10px;
}
</style>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><cfoutput>#site_name#</cfoutput> :: Polls</td>
  </tr>
  <tr>
    <td><cfif isDefined("url.action") and url.action eq "dsp_results">
<!---Display Results--->
<!---Results would have been Shown.--->
<cfinvoke component="polls" method="dspresults" returnvariable="poll_results">
  <cfinvokeargument name="poll_color" value="tan">
  <!---Valid Colors are: blue | gold | green | grey | lavender| lblue | ltan | tan | red | silver | tan | white | yellow--->
  <cfinvokeargument name="poll_domain" value="#CGI.HTTP_HOST#">
  <cfinvokeargument name="vote_width" value="175">
  <cfinvokeargument name="vote_results_img" value="poll-graph1.jpg">
  <cfinvokeargument name="datasrc" value="#datasrc#">
  <cfinvokeargument name="modules_dir" value="#site_modules_dir#">
  <cfinvokeargument name="templates_dir" value="#site_template_dir#">
  <cfinvokeargument name="template" value="#site_template#">
  <cfinvokeargument name="site_domain" value="#site_domain#">
  <cfinvokeargument name="site_folder" value="#site_folder#">
  <cfinvokeargument name="results_display" value="html">
</cfinvoke>
<!---End of Display Results--->
<cfelseif isDefined("url.action") and url.action eq "act_results">
<!---Vote * Display Results--->
<!---Results would have been compiled and displayed.--->
<cfinvoke component="polls" method="actresults" returnvariable="poll_results">
  <cfinvokeargument name="poll_color" value="tan">
  <!---Valid Colors are: blue | gold | green | grey | lavender| lblue | ltan | tan | red | silver | tan | white | yellow--->
  <cfinvokeargument name="poll_domain" value="#CGI.HTTP_HOST#">
  <cfinvokeargument name="vote_width" value="175">
  <cfinvokeargument name="vote_results_img" value="poll-graph1.jpg">
  <cfinvokeargument name="datasrc" value="#datasrc#">
  <cfinvokeargument name="modules_dir" value="#site_modules_dir#">
  <cfinvokeargument name="templates_dir" value="#site_template_dir#">
  <cfinvokeargument name="template" value="#site_template#">
  <cfinvokeargument name="site_domain" value="#site_domain#">
  <cfinvokeargument name="site_folder" value="#site_folder#">
</cfinvoke>
<!---End of Vote & Display Results--->

<cfelseif Not isDefined("url.action")>
<!---Load and Display Poll--->
<cfinvoke component="polls" method="getpolls" returnvariable="poll">
  <cfinvokeargument name="poll_color" value="tan">
  <!---Valid Colors are: blue | gold | green | grey | lavender| lblue | ltan | tan | red | silver | tan | white | yellow--->
  <cfinvokeargument name="poll_domain" value="#CGI.HTTP_HOST#">
  <cfinvokeargument name="vote_width" value="175">
  <cfinvokeargument name="vote_results_img" value="poll-graph1.jpg">
  <cfinvokeargument name="datasrc" value="#datasrc#">
  <cfinvokeargument name="modules_dir" value="#site_modules_dir#">
  <cfinvokeargument name="templates_dir" value="#site_template_dir#">
  <cfinvokeargument name="template" value="#site_template#">
  <cfinvokeargument name="site_domain" value="#site_domain#">
  <cfinvokeargument name="site_folder" value="#site_folder#">
</cfinvoke>
<!---End of Load and Display Poll--->
</cfif></td>
  </tr>
  <cfif isDefined("url.action") and url.action eq "poll_stats">
<cfinvoke component="polls" method="pollstats" returnvariable="pollstats">
  <cfinvokeargument name="poll_color" value="tan">
  <!---Valid Colors are: blue | gold | green | grey | lavender| lblue | ltan | tan | red | silver | tan | white | yellow--->
  <cfinvokeargument name="poll_domain" value="#CGI.HTTP_HOST#">
  <cfinvokeargument name="vote_width" value="175">
  <cfinvokeargument name="vote_results_img" value="poll-graph1.jpg">
  <cfinvokeargument name="datasrc" value="#datasrc#">
    <cfinvokeargument name="modules_dir" value="#site_modules_dir#">
  <cfinvokeargument name="templates_dir" value="#site_template_dir#">
<cfinvokeargument name="template" value="#site_template#">
</cfinvoke><br />
<table width="95%" border="0" cellspacing="0" cellpadding="0" class="pollstats" align="center">
  <tr>
    <td class="pollstats_header" colspan="6" align="center"><b><u>Polls Phase III Stats</u></b><br />
You can select a poll's ID Number to View the Overall Stats for each Poll's Results. 
</td>
  </tr>
  <tr>
    <td width="75" class="pollstats_header"><b>Poll ID</b></td>
    <td width="100" class="pollstats_header"><b>IP Address</b></td>
    <td width="100" class="pollstats_header"><b>Country</b></td>
    <td width="100" class="pollstats_header"><b>Host</b></td>
    <td width="250" class="pollstats_header"><b>Referrer</b></td>
    <td width="250" class="pollstats_header"><b>Browser/OS</b></td>
  </tr>
  <cfoutput>
<cfloop query="pollstats">  
  <tr>
    <td class="pollstats_results"><a href="index.cfm?action=poll_chart&QID=#poll_id#">#poll_id#</a></td>
    <td class="pollstats_results">#ipaddress#</td>
    <td class="pollstats_results">#country#</td>
    <td class="pollstats_results">#host#</td>
    <td class="pollstats_results">#referrer#</td>
    <td class="pollstats_results">#agent#</td>
  </tr>
  </cfloop>
  </cfoutput>
</table>
 <a href="index.cfm?action=poll_stats">Refresh View Stats</a> | <a href="index.cfm">Return to Polls</a>
    <cfelseif isDefined("url.action") and url.action eq "poll_chart">
    <cfinvoke component="polls" method="pollcharts" returnvariable="pollcharts" >  
     
  <cfinvokeargument name="poll_color" value="tan">
  <!---Valid Colors are: blue | gold | green | grey | lavender| lblue | ltan | tan | red | silver | tan | white | yellow--->
  <cfinvokeargument name="poll_domain" value="#CGI.HTTP_HOST#">
  <cfinvokeargument name="vote_width" value="175">
  <cfinvokeargument name="vote_results_img" value="poll-graph1.jpg">
  <cfinvokeargument name="datasrc" value="#datasrc#">
    <cfinvokeargument name="modules_dir" value="#site_modules_dir#">
  <cfinvokeargument name="templates_dir" value="#site_template_dir#">
<cfinvokeargument name="template" value="#site_template#">
</cfinvoke><br />

	
<cfquery name="polls" datasource="#datasrc#">
select * from poll_questions where questionid = '#url.QID#'
</cfquery>
You are Currently Viewing the Result Stats for Poll ID: <b><cfoutput>#url.QID#</cfoutput></b>: <b>'<i><cfoutput query="polls">#Question_name#</cfoutput></i>'.</b><br />

Results Stats for the Poll: <b>'<i><cfoutput query="polls">#Question#</cfoutput></i>'.</b>
  <cfoutput>
  <cfloop query="pollcharts">
 
    <cfquery name="Number_of_questions" datasource="#datasrc#">
SELECT * FROM poll_answers WHERE QuestionID = #URL.QID#
</cfquery>
<cfset TotalRows = Number_of_questions.RecordCount>
<cfset Tot_answers = 0>
<cfloop query="Number_of_questions" startrow="1" endrow="#TotalRows#">
<!--- Find new total vote answers. --->
<cfset Tot_answers = Tot_answers + #Votes#>
</cfloop>
	<cfset Percent=Round((Votes / Tot_answers) * 100)></td>
  
  </cfloop>
  </cfoutput>
<!---Begin the Charts--->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><cfoutput><b>Poll Stats for Poll <i>#polls.Question#</i></b></cfoutput></td>
  </tr>
  <tr>
    <td><cfchart format="flash" scalefrom="1" scaleto="100" showxgridlines="no"
             showygridlines="no" showborder="no" fontbold="no" fontitalic="no"
             xaxistitle="Questions" yaxistitle="Votes" show3d="no" rotated="no"
             sortxaxis="no" showlegend="no" showmarkers="no">
                     <cfchartseries type="bar" serieslabel="Poll Stats for Poll #polls.Question#" seriescolor="##0099FF">
                     <cfloop query="Number_of_questions" startrow="1" endrow="#TotalRows#">
                     <cfchartdata item="#Number_of_questions.Answer#" value="#percent#">
                     </cfloop>
                     </cfchartseries>
</cfchart></td>
  </tr>
</table>



<!---End of the Charts--->
<a href="index.cfm?action=poll_stats"><strong><br />
   BACK TO THE POLLS STATS</strong></a></cfif></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;
    </td>
  </tr>
</table>