<cf_headfoot>
<cfparam name="attributes.script" default="WebOS Adminsitration Panel Panel">
<cfparam name="attributes.page" default="Home Page">
<cfparam name="current_version" Default="1.25">
<cfparam name="valid_license" Default="WEBOS_001_RC1_A">
<cfquery name="modules_installed" datasource="#datasrc#">
select * from #table_mods# where module_installed ='1' and module_admin='1'
</cfquery>
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style1 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>

<cfif ListFindNoCase("#allusers#", session.permissions, ",")>

<!--- BEGINNING OF YOUR CONTENT --->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Welcome to the WebOS Administration Panel</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr><td>
<cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
</cfquery>

<table border="0" align="center" cellpadding="0" cellspacing="0" width="98%">
  <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
    <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c9" alt="" /></td>
    <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">What's new in WebOS Version: <i><cfoutput>#version.configuration_value#</cfoutput></i> (RC1.5)</span></td>
    <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c10" alt="" /></td>
  </tr>
  <tr>
    <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
    <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
      <tr>
        <td valign="top"><cfif #version.configuration_value# LT #current_version#>
            <font color="#990000"> Your Current Version of WebOS:: <b><cfoutput>#current_version#</cfoutput></b>is out-of-date. <br />Current Supported Version is: <b><cfoutput>#current_version#</cfoutput></b></font>
			<cfelseif #version.configuration_value# EQ #current_version#>
            <font color="#006600"> Your Current Version of WebOS:: <b><cfoutput>#current_version#</cfoutput></b> is up-to-date.
            <br /><cfquery name="license" datasource="#datasrc#">
            select configuration_value from #table_config# where configuration_key ='site_license'
            </cfquery>
            <cfif #license.configuration_value# EQ #valid_license#>
            Your WebOS License, <b><cfoutput>#license.configuration_value#</cfoutput></b> is Valid.
            <cfelseif #license.configuration_value# NEQ #valid_license#>
            </font><font color="#990000">Your WebOS License, <b><cfoutput>#licsense.configuration_value#</cfoutput></b> is In-Valid. Please Purchase a Valid License.
            </font>
            </cfif>
			</cfif></font>
            <br /><br />
            <cfif #view_page_rank# EQ "1">
            <!---\\ Page Rank Section //--->
            <cfset getRank = createObject("component","getRank").init() />
             <!---\\The Tag below is for a Single Website//--->
<cfset aCheck = ListToArray("www.#site_domain#") />
    <!---\\the Tag Below is for multiple Sites //--->
    <!---\\Each Site Listed will be returned//--->
    <!---<cfset aCheck = ListToArray("www.yahoo.com,www.msn.com,www.aol.com,www.adobe.com,www.google.com,www.yakhnov.info,www.travellerspoint.com") />--->
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3"><div align="center"><strong>Your Website's Page Rank:</strong></div></td>
  </tr>
  <cfloop index="i" from="1" to="#ArrayLen(aCheck)#">
  <tr>
    <td width="48%" align="left" valign="top"><cfoutput>#aCheck[i]#</cfoutput> on Alexa:</td>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="48%" align="left" valign="top"><cfoutput><b>#getRank.getAlexaRank(aCheck[i])#</b></cfoutput></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top"><cfoutput>#aCheck[i]#</cfoutput> on Google:</td>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="48%" align="left" valign="top"><cfoutput><b>#getRank.getGoogleRank(aCheck[i])#</b></cfoutput></td>
  </tr>
  </cfloop>
</table>
    <!---\\End of Page Rank//--->
	 </cfif>
            <hr />
            <div style="overflow:auto; width:auto; height: 175px;">
            <ul>
            <li>Release Candidate 1.5 (RC1.5) has debuted.</li>
            <li>Inquiry Form, now sends direct inputs from form.</li>
            <li>Admin Interface Clean-up and Re-organization.</li>
            <li>Module Installer added to Admin Panel:: Modules.cfm</li>
            <li>SEF URLS no longer interferes with Admin Panel</li>
            <li>Minor Bug Fixes repaired, lots of code cleanup</li>
            <li>Site Content Menu now populates with Modules that are currently installed and have admin interface.</li>
            <li>Added <a href="styles_admin.cfm">Style Sheet Administrator</a> for current Theme's Style Sheet</li>
            <li>Added Configuration Value to Enable/Disable Displaying of Company info on Contact Us Page</li>
            <li>Added <a href="admin_sql.cfm">SQL Query Engine</a> to Admin, to run SQL Queries without having to run an external database management tool.</li>
            <li> Re-Vamped the initial Inquiry Form</li>
            <li> Inquiries are now stored in DB rather than Emailed to Site Owner</li>
            <li>Inquiries now have editable subjects, and Inquiries are viewable through Admin Panel</li>
            <li>New Inquiries &amp; Inquiries Needing Replies are now viewable from Admin Main Page</li>
            <li><B>RC1.5 New!</B> Added Page Rank check and display. <a href="configuration.cfm">View your Site's Page Rank now!</a></li>
            <li><B>RC1.5 New!</B> Toggle Page Rank on/off in Main & Configuration page!</li>
            <li><b>RC1.5 New!</b> View new Users to your site! New users are viewable from Admin Main Page!</li>
           <li><b>RC1.5 New!</b> Added MSWord Markup Cleanup to WYSIWYG Editor! To Use it, input your code and click on the <img src="assets/icons/pasteword_on.gif" align="absmiddle" /> Icon in Text View.</li>
           <li><b>RC1.5 New!</b> Cleaned Up and Re-organized Admin Menu!</li>
           <li><b>RC1.5 New!</b> Added Topic Help: Mouse over a link, and it will help you. (Currently only works on menus). </li>
           <li><b>RC1.5 New!</b> Updated and Fixed Forum Module. New Database Tables as well.</li>
           <li><b>RC1.5 New!</b> New Template: WebOS-Silver:: Pure CSS-Based Layout</li>
           <li><b>RC1.5 New!</b> Updated Modules for CSS Layout Compatibility</li>
           <li><b>RC1.5 New!</b> Updated Templates, Left_col and Right_col No Longer Supported</li>
           <li><b>RC1.5 New!</b> Left and Right Cols replaced by sideboxes</li>
           <li><b>RC1.5 New!</b> Added new configuration value <i>css_template</i> to System configuration. Tells the systme if you are running a CSS-Based layout or Not.</li>
           <li><b>RC1.5 New!</b> Update Site's WYSIWYG editor. Much more feature rich, and easier to use.</li>
           <li><b>RC1.5 New!</b> Update Site's WYSIWYG editor. Much more feature rich, and easier to use.</li>
            </ul>
            </div>
            </td>
      </tr>
    </table></td>
    <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c9" alt="" /></td>
    <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
    <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c10" alt="" /></td>
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

<br />
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
  <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
    <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c2" alt="" /></td>
    <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Administration Quick Links</span></td>
    <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
    <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
      <tr>
        <td width="48%" align="center" valign="top">
          <center>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="27%"><img src="assets/modules/modules_config.jpg" alt="WebOS System Configuration" width="100" height="100"/></td>
                <td width="73%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
                  <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
                  <tr>
                    <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c5" alt="" /></td>
                    <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Website Configuration</span></td>
                    <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c6" alt="" /></td>
                  </tr>
                  <tr>
                    <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                    <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                        <tr>
                          <td valign="top"><cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
                </cfquery>
                              <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="module_inquiry.cfm?do=e_conos">Edit Company Information</a><br />
                              <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="module_inquiry.cfm?do=e_cohrs">Edit Company Hours</a><br />
                              <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="configuration.cfm">Edit Site Configuration</a></td>
                        </tr>
                    </table></td>
                    <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c5" alt="" /></td>
                    <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                    <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c6" alt="" /></td>
                  </tr>
                </table></td>
              </tr>
            </table>
          </center></td>
        <td width="2%" align="center" valign="top">&nbsp;</td>
        <td width="48%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="26%"><img src="assets/modules/modules_modules.jpg" alt="WebOS Modules Configuration" width="100" height="100"/></td>
            <td width="74%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
              <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
              <tr>
                <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c7" alt="" /></td>
                <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Modules Configuration</span></td>
                <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c8" alt="" /></td>
              </tr>
              <tr>
                <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                      <td valign="top"><cfquery name="version" datasource="#datasrc#">
select configuration_value from #table_config# where configuration_key ='webos_version'
            </cfquery>
                          <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="modules.cfm">Modules Configuration</a><br />
                          <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="module_installer.cfm">Install a New Module</a></td>
                    </tr>
                </table></td>
                <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c7" alt="" /></td>
                <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c8" alt="" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="48%" align="center" valign="top">&nbsp;</td>
        <td width="2%" align="center" valign="top">&nbsp;</td>
        <td width="48%" align="center" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="48%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="17%"><img src="assets/modules/modules_inquiry.jpg" width="100" height="100" /></td>
            <td width="83%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
              <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
              <tr>
                <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c11" alt="" /></td>
                <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"> New Inquires this Week: <b>
                      <cfset week_start ="#DateFormat(DateAdd("d", "-#DayOfWeek(Now()) - 1#", Now()), "MM/DD/YYYY")#">
                      <cfquery name="new_inquiries" datasource="#datasrc#">
          select * from #table_inquiry_submit# where date_submitted >= '#dateformat(now(), "MM/DD/YYYY")#' and date_submitted >= '#week_start#'
                </cfquery>
                  <cfoutput>#new_inquiries.recordcount#</cfoutput></span></td>
                <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c12" alt="" /></td>
              </tr>
              <tr>
                <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                      <td valign="top"><img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="module_inquiry.cfm?do=view_submitted">View New Inquiries</a><br />
                          <img src="assets/icons/icon_edit_topic.gif" width="15" height="15" />Inquiries that Require Replies :
                        <cfquery name="need_reply" datasource="#datasrc#">
          select * from #table_inquiry_submit# where replied_to ='0'
              </cfquery>
                        <b><cfoutput>#need_reply.recordcount#</cfoutput></b></td>
                    </tr>
                </table></td>
                <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c11" alt="" /></td>
                <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c12" alt="" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="2%" align="center" valign="top">&nbsp;</td>
        <td width="48%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="16%"><img src="assets/modules/modules_users.jpg" width="100" height="100" /></td>
            <td width="84%"><table border="0" align="center" cellpadding="0" cellspacing="0" width="95%">
              <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
              <tr>
                <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c13" alt="" /></td>
                <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"> New Users this Week: <b>
                      <cfset users_week_start ="#DateFormat(DateAdd("d", "-#DayOfWeek(Now()) - 1#", Now()), "MM/DD/YYYY")#">
                      <cfquery name="new_users" datasource="#datasrc#">
          select * from #table_usrs# where sign_up_date >= '#dateformat(now(), "MM/DD/YYYY")#' and sign_up_date >= '#users_week_start#'
                </cfquery>
                      <cfoutput>#new_users.recordcount#</cfoutput></span></td>
                <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c14" alt="" /></td>
              </tr>
              <tr>
                <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
                <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                      <td valign="top"><img src="assets/icons/icon_edit_topic.gif" width="15" height="15" /><a href="users.cfm">View New Users</a></td>
                    </tr>
                </table></td>
                <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c13" alt="" /></td>
                <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
                <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c14" alt="" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c2" alt="" /></td>
    <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
    <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c4" alt="" /></td>
  </tr>
</table>
<!--- END OF YOUR CONTENT --->
<cfelse>
You are not authorized to view this page.
</cfif>


</cf_headfoot>
