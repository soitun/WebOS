<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Podcasts Adminsitration">
<script language="javascript" type="text/javascript" src="assets/scripts/common.js">
</script>
<script type="text/javascript">
<!--
var txt_advanced_editor_warning = "Advanced editor mode cannot be enabled, as this mode is available only in the following web browsers:\nIE5.5+ (Windows)\nLatest version of Netscape, Mozilla & Firefox (Windows)";
var isHTML_Editor = (
		(localBFamily == 'MSIE' && parseInt(localVersion) >= 5) || 
		(localBrowser == 'Netscape' && parseInt(localVersion) >= 8) || 
		((localBrowser == 'Firefox' || localBrowser == 'Mozilla') && parseInt(localVersion) >= 1) || 
		(localBrowser == 'Opera' && parseInt(localVersion) >= 9)
	);
var isHTML_EditorFF = (localBrowser == 'Firefox');
-->
</script>
<script src="assets/scripts/wysiwyg/innovaeditor.js" language="JavaScript" type="text/javascript"></script>

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
<!---\\ Add Function //--->
<cfif do EQ "add">
<cfif isdefined("form.pod_cast_filename") and #form.pod_cast_filename# NEQ ""> 
  <!---  The uploadfile destination path is declared as a variable in the application.cfm file you may need to verify the precise path with your host ---> 
  <cffile action="upload" filefield="pod_cast_filename" destination="C:\inetpub\wwwroot\_local_dev\_webos\modules\podcasts\files\" nameconflict="overwrite" accept="audio/*" > 
  <cfset uploadedfile = "C:\inetpub\wwwroot\_local_dev\_webos\modules\podcasts\files\#file.serverfile#"> 
  <!---<cfoutput>#file.ServerFile#</cfoutput>--->
    </cfif>
<CFTRANSACTION>
   <cfquery name="add_podcast" datasource="#datasrc#">
	INSERT INTO #table_pods# (pod_cast_filename, pod_cast_filesize, pod_cast_title, pod_cast_playtime, pod_cast_description, pod_cast_category) values ('#file.serverfile#', '#VAL(CGI.CONTENT_LENGTH/1000)# KB', '#form.pod_cast_title#', '#form.pod_cast_playtime#', '#form.podcast_description#', '#form.podcast_category#')  
</cfquery>
</CFTRANSACTION>
  <cflocation url="module_podcasts.cfm?do=m" addToken="No">
</CFIF>
<cfif do EQ "add_cat_save">
<cftransaction>
<cfquery name="add_pod_cat" datasource="#datasrc#">
insert into #table_pod_cats# (pod_cast_category_name) values ('#form.pod_cast_category_name#')
</cfquery>
</cftransaction>
<cflocation url="module_podcasts.cfm?do=m" addtoken="no">
</cfif>
<!---\\ url.Delete Function //--->
<cfif do EQ "delete">
<cfquery name="deletefile" datasource="#datasrc#">
select pod_cast_filename from #table_pods# where pod_cast_id=#url.id#
</cfquery>
<cffile action="delete" file="C:\inetpub\wwwroot\_local_dev\_webos\modules\podcasts\files\#deletefile.pod_cast_filename#">
<CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_admin_news">
	DELETE FROM #table_pods# WHERE pod_cast_id = #url.id#
  </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_podcasts.cfm?do=m" addToken="No">
</cfif>
<cfif do EQ "delete_cat">
<CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_admin_news">
	DELETE FROM #table_pod_cats# WHERE pod_cast_catid = #url.id#
  </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_podcasts.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif do EQ "update">
 <cfif isdefined("form.pod_cast_filename") and #form.pod_cast_filename# NEQ ""> 
  <!---  The uploadfile destination path is declared as a variable in the application.cfm file you may need to verify the precise path with your host ---> 
  <cffile action="upload" filefield="pod_cast_filename" destination="C:\inetpub\wwwroot\_local_dev\_webos\modules\podcasts\files\" nameconflict="overwrite" accept="audio/*" > 
  <cfset uploadedfile = "C:\inetpub\wwwroot\_local_dev\_webos\modules\podcasts\files\#file.serverfile#"> 
  <!---<cfoutput>#file.ServerFile#</cfoutput>--->
    </cfif>
 <CFTRANSACTION>
<cfquery name="Updatecast" datasource="#datasrc#">
		 UPDATE #table_pods#
		 SET pod_cast_title ='#form.pod_cast_title#', pod_cast_playtime='#form.pod_cast_playtime#', pod_cast_description='#form.podcast_description#', pod_cast_category ='#form.podcast_category#' <cfif isdefined("form.pod_cast_filename") and #form.pod_cast_filename# NEQ "">,pod_cast_filename='#file.serverfile#' </cfif> WHERE pod_cast_id = #Form.ID#
</cfquery>
  </CFTRANSACTION>
<cflocation url="module_podcasts.cfm?do=m" addToken="No">
</cfif>
<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style1 {	color: #6C7A83;
	font-weight: bold;
}
.style2 {color: #6C7A83}
-->
</style>
<cfif ListFindNoCase("#allusers#", session.permissions, ",")>
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
    <td width="100" valign="top"><img src="assets/modules/modules_podcasts.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add A Podcast</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Podcast</a><br />
      </cfif>
      <br />
<cfif do EQ "a_cat">
      <b><a href="?do=a_cat">Add A Podcast Category</a><br /></b>
      <cfelse>
      <a href="?do=a_cat">Add a Podcast Category</a><br />
      </cfif>
      <br />
      <cfif do EQ "edit_cat_index">
      <b><a href="?do=edit_cat_index">Edit A Podcast Category</a><br /></b>
      <cfelse>
      <a href="?do=edit_cat_index">Edit a Podcast Category</a><br />
      </cfif>
      <br />
      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can  add, edit and delete Podcasts on your WebOS Site.
      <hr width="95%" align="center"/>
<CFQUERY DataSource="#datasrc#" Name="display_podcasts">
			SELECT *
			FROM #table_pods#
</CFQUERY>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="51%" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Title</font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Category</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>File Size</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_podcasts" StartRow="1" EndRow="#display_podcasts.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td><b>#display_podcasts.pod_cast_title#</b><br />
            <i>#display_podcasts.pod_cast_filename#</i></td>
        <td align="center"><cfquery name="podcast_cat" datasource="#datasrc#">
        select * from #table_pod_cats# where pod_cast_catid ='#display_podcasts.pod_cast_category#'
        </cfquery>
          #podcast_cat.pod_cast_category_name# </td>
        <td align="center">#display_podcasts.pod_cast_filesize#</td>
        <td align="center"><a href="?do=e&amp;id=#display_podcasts.pod_cast_id#"><img src="assets/icons/icon_edit_topic.gif" width="15" height="15" border="0" alt="e" /></a></td>
        <td align="center"><a href="?do=d&amp;id=#display_podcasts.pod_cast_id#"><img src="assets/icons/icon_delete_reply.gif" width="15" height="15" border="0" alt="d" /></a></td>
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
<cfquery name="getpodscats" datasource="#datasrc#">
select * from #table_pod_cats# 
</cfquery>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Podcast</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_podcast" method="post" action="?do=add" enctype="multipart/form-data" >
     <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="48%" align="left" valign="top">Pod Cast Title:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="text" name="pod_cast_title" id="pod_cast_title" /></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">Pod Cast Description:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><textarea name="podcast_description" id="pod_cast_description" cols="45" rows="5"></textarea></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top">&nbsp;</td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">PodCast Playtime:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="text" name="pod_cast_playtime" id="pod_cast_playtime" /> 
          (MIN:SECS)</td>
        </tr>
	   <tr>
        <td width="48%" align="left" valign="top"><p>File:</p></td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input name="pod_cast_filename" id="pod_cast_filename" type="file" /><br /> 
        </td>
      </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">PodCastCategory:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><select name="podcast_category">
        <option value="">Select the category for the PodCast</option>
        <cfoutput query="getpodscats" group="pod_cast_category_name">
        <option value="#pod_cast_catid#" >#pod_cast_category_name#</option>
        </cfoutput>
        </select></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top">&nbsp;</td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
	  </tr>
	  </table>
</form>      </td>
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
</form>
    <cfelseif do EQ "e">
    <cfquery name="getpodscats" datasource="#datasrc#">
select * from #table_pod_cats# 
</cfquery>
<cfquery name="read_pod" datasource="#datasrc#">
select * from #table_pods# where pod_cast_id =#url.id#
</cfquery>

<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit PodCast</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td> <form name="add_podcast" method="post" action="?do=update" enctype="multipart/form-data" >
      <input type="hidden" name="id" value="<cfoutput>#url.id#</cfoutput>">
	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="48%" align="left" valign="top">Pod Cast Title:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="text" name="pod_cast_title" id="pod_cast_title" value="<cfoutput>#read_pod.pod_cast_title#</cfoutput>"/></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">Pod Cast Description:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><textarea name="podcast_description" id="pod_cast_description" cols="45" rows="5"><cfoutput>#read_pod.pod_cast_description#</cfoutput></textarea></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top">&nbsp;</td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">PodCast Playtime:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="text" name="pod_cast_playtime" id="pod_cast_playtime" value="<cfoutput>#read_pod.pod_cast_playtime#</cfoutput>"/> 
          (MIN:SECS)</td>
        </tr>
	   <tr>
        <td width="48%" align="left" valign="top"><p>File:</p></td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input name="pod_cast_filename" id="pod_cast_filename" type="file" /><br /> 
        </td>
      </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">PodCastCategory:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><select name="podcast_category">
        <option value="">Select the category for the PodCast</option>
        <cfoutput query="getpodscats" group="pod_cast_category_name">
        <option value="#pod_cast_catid#" <cfif #read_pod.pod_cast_category# EQ #pod_cast_catid#>Selected</cfif>>#pod_cast_category_name#</option>
        </cfoutput>
        </select></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top">&nbsp;</td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="submit" name="button" id="button" value="Edit PodCast" /></td>
        </tr>
	  </table>
</form>      </td>
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
<CFELSEIF do IS "a_cat">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add PodCast Category:</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_podcast_cat" method="post" action="?do=add_cat_save">
	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="48%" align="left" valign="top">Pod Cast Category Name:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="text" name="pod_cast_category_name" id="pod_cast_category_name" /></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="submit" name="button" id="button" value="Add PodCast" /></td>
        </tr>
	  </table>
</form>      </td>
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
<CFELSEIF do IS "edit_cat_index">
<!---\\Edit Category //--->
<cfquery name="display_cats" datasource="#datasrc#">
select * from #table_pod_cats#
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Pod Cast Categories</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="51%" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Category Title</font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Number of Casts in Category</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_cats" StartRow="1" EndRow="#display_cats.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td><b>#display_cats.pod_cast_category_name#</b></td>
        <td align="center"><cfquery name="podcast_count" datasource="#datasrc#">
        select * from #table_pods# where pod_cast_category ='#display_cats.pod_cast_catid#'
        </cfquery>
        #podcast_count.recordcount#       </td>
        <td align="center"><A HREF="?do=edit_cat&id=#display_cats.pod_cast_catid#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=del_cat&id=#display_cats.pod_cast_catid#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table>
</td>
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
<cfelseif do EQ "edit_cat">
<cfquery name="edit_cat" datasource="#datasrc#">
select * from #table_pod_cats# where pod_cast_catid='#url.id#'
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Podcast Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
<form name="add_podcast_cat" method="post" action="?do=edit_cat_save">
<input type="hidden" name="id" value="<cfoutput>#url.id#</cfoutput>">
	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="48%" align="left" valign="top">Pod Cast Category Name:</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="text" name="pod_cast_category_name" id="pod_cast_category_name" value="<cfoutput>#edit_cat.pod_cast_category_name#</cfoutput>"/></td>
        </tr>
	  <tr>
	    <td width="48%" align="left" valign="top">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td align="left" valign="top"><input type="submit" name="button" id="button" value="Edit PodCast" /></td>
        </tr>
	  </table>
</form></td>
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
<cfelseif do EQ "del_cat">
<cfquery name="delete_cat" datasource="#datasrc#">
select * from #table_pod_cats# where pod_cast_catid='#url.id#'
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Podcast Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
Are you Certain you want to Delete the Category: <b><cfoutput>#delete_cat.pod_cast_category_name#</cfoutput></b><br /><br />
<a href="?do=del_cat&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="?do=m">No</a></td>
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
<cfelseif do EQ "d">
<CFQUERY DataSource="#datasrc#" Name="delete_article">
			SELECT *
			FROM #table_pods# where pod_cast_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Podcast</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the form field: <b><cfoutput>#delete_article.pod_cast_title#</cfoutput></b><br />
  <br />
   <a href="?Delete=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_articles.cfm">No</a></td>
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