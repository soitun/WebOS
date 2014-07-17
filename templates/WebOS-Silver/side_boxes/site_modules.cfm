<div id="menu_box_title">
Available Sections
</div>
<div id="menu_box">
<cfoutput>
    <cfloop query="module_config">
     <cfif NOT isDefined('url.module') or #url.module# NEQ #module_directory#>
&nbsp;<img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="#module_name#" width="7" height="12">&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=#module_directory#" class="menu_items">&nbsp;#module_name#</a><br />
<cfelseif #url.module# EQ #module_directory#>
&nbsp;<img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet_active.jpg" alt="#module_name#" width="7" height="12">
&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=#module_directory#" class="menu_items">&nbsp;#module_name#</a></b><br />
</cfif>
  </cfloop>
  </cfoutput>
</div>
<br /><br />
<br /><br />
<br /><br />
<br /><br />