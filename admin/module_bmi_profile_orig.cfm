<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="BMI Profile Administration Page">
<!---\\ Module Functions (add, edit, update, delete) Go here //--->
<CFPARAM name="row_color" default="1">
<cfif NOT isDefined('url.do')>
<CFPARAM name="do" default="m">
<cfelseif isDefined('url.do')>
<CFPARAM name="do" default="#url.do#">
</cfif>
<CFPARAM name="Delete" default="no">
<CFPARAM name="Update" default="none">
<CFPARAM name="Add" default="none">
<CFPARAM name="message" default="none">
<CFPARAM name="inPage" default="0">
<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style1 {font-weight: bold}
.style2 {font-weight: bold}
-->
</style><cfif ListFindNoCase("#allusers#", session.permissions, ",")>
<style type="text/css">
<!--
.style1 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>
<!--- BEGINNING OF YOUR CONTENT --->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"><cfoutput>#attributes.page#</cfoutput></span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" valign="top"><img src="assets/modules/modules_bmi.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can view your member's progress logs, personal goals and quiz answers.
   
    <hr width="95%" align="center"/>
    <cfquery name="get_users" datasource="#datasrc#">
    select * from #table_usrs#
    </cfquery>
    
    <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="150" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>UserName</strong></font></span></td>
    <td width="150" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Taken Quiz</strong></font></span></td>
    <td width="150" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Has Set Goals</font></strong></td>
    <td width="150" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Has Progress Log</font></strong></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="get_users" StartRow="1" EndRow="#get_users.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="150" align="center"><b>#username#</b><br><i>(#firstname# #lastname#)</i><br /> Age: #age#</td>
        <td width="150" align="center" valign="top"><cfquery name="get_users_quiz" datasource="#datasrc#">
        select * from webos_bmi_quiz where user_name ='#get_users.username#'
        </cfquery>
        <cfif #get_users_quiz.recordcount# EQ "0">
        <font color="##990000"><b>No</b></font>
        <cfelseif #get_users_quiz.recordcount# NEQ "0">
        <font color="##009900"><b>Yes</b></font><br />
        Taken Quiz: <B>#get_users_quiz.recordcount#</B><br />
        <a href="?do=view_quiz&user=#get_users.username#">View Quiz Results</a>
        </cfif>
    </td>
        <td width="150" align="center" valign="top"><cfquery name="get_users_goals" datasource="#datasrc#">
    select * from webos_bmi_log_book where username='#get_users.username#'
    </cfquery>
    <cfif #get_users_goals.recordcount# EQ "0">
     <font color="##990000"><b>No</b></font>
     <cfelseif #get_users_goals.recordcount# NEQ "0">
     <font color="##009900"><b>Yes</b></font><br />
     Total Entries: <B>#get_users_quiz.recordcount#</B><br />
     <a href="?do=view_goals&user=#get_users.username#">View Personal Goals Results</a>
     </cfif>
     </td>
        <td width="150" align="center" valign="top">
          <cfquery name="get_users_plogs" datasource="#datasrc#">
    select * from webos_bmi_progress_log where username='#get_users.username#'
    </cfquery> 
    <cfif #get_users_plogs.recordcount# EQ "0">
     <font color="##990000"><b>No</b></font>
     <cfelseif #get_users_plogs.recordcount# NEQ "0">
     <font color="##009900"><b>Yes</b></font><br />
     Total Entries: <B>#get_users_plogs.recordcount#</B><br />
     <a href="?do=view_progress&user=#get_users.username#">View Progress Log Results</a>
     </cfif>
       </td>
          <td align="center"><A HREF="?do=e&id=#id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&username=#username#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table>
    <cfelseif do EQ "a">
    
    <cfelseif do EQ "e">
    
    <cfelseif do EQ "d">
    
    <cfelseif do EQ "view_quiz">
    
    <cfelseif do EQ "view_goals">
    
    <cfelseif do EQ "view_progress">
    
    </cfif>    </td>
    </tr>
</table></td>
</tr>
</table></td>
   <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
   
  </tr>
  <tr>
   <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c1" alt="" /></td>
   <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
   <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c3" alt="" /></td>
   
  </tr>
</table>
<!--- END OF YOUR CONTENT --->
<cfelse>
You are not authorized to view this page.
</cfif>
</cf_headfoot>