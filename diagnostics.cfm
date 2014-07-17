<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><cfoutput>#site_name#</cfoutput></title>


<style type="text/css">
<!--
@import url("http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir##site_styles_dir##site_style_sheet#</cfoutput>");

-->
</style>
</head>

<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="48%" align="left" valign="top">WebOS Diagnostics:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <cfoutput>
  <cfloop query="system_config">
  <tr>
    <td width="48%" align="left" valign="top">#configuration_key#</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#configuration_value#</td>
  </tr>
  </cfloop>
  </cfoutput>
</table>

</body>
</html>