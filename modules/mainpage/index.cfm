<!---\\ Module Configuration //--->
<cfset module ="mainpage">
<!---\\ End of Module Configuration //---->
<!---\\ The Content For your Site's Main Welcome Page //--->
<cfif css_template EQ "1">
<cfoutput query="mainpage_content">
<center>
<div id="center_box_title">
#main_page_title#
</div>
<div id="center_box">
#main_page_content#
<cfif #mainpage_content.main_page_time_sensitive# EQ "1">
    This Page Expires on: #dateformat(mainpage_content.main_page_expire_date, "MM/DD/YYYY")#
    </cfif>
</div>
</center>
</cfoutput>
<cfelse>
<cfoutput query="mainpage_content">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">#main_page_title#</td>
  </tr>
  <tr>
    <td>#main_page_content#</td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"><cfif #mainpage_content.main_page_time_sensitive# EQ "1">
    This Page Expires on: #dateformat(mainpage_content.main_page_expire_date, "MM/DD/YYYY")#
    </cfif>
    </td>
  </tr>
</table>
</cfoutput>
</cfif>