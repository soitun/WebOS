<link href="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_folder#styles/default.css" type="text/css">
<table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" colspan="3" class="breadcrumb_nav" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif">#site_name# Contact Form Inquiry Submission</td>
  </tr>
  <cfquery name="get_form_fields" datasource="#datasrc#">
  select * from #table_inquiry# where display_field ='1'
  </cfquery>
  <cfloop query="get_form_fields"> 
  <tr>
    <td>#field_name#</td>
    <td>&nbsp;</td>
    <td>#form.field_name#</td>
  </tr>
  </cfloop>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="top" class="footer">&copy;Copyright <cfoutput>#dateformat(now(), "YYYY")#</cfoutput> All Rights Reserved. <br> The Contents of the Email Transmission is intended for the Addressed recipient. If you are not the addressed recipient, please <b>DELETE</b> this email immediately.</td>
  </tr>
</table>

