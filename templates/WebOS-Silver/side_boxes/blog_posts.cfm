<div id="menu_box_title">
Current Blog Posts
</div>
<div id="menu_box">
<cfoutput>
    <cfloop query="current_posts">
    <cfif isDefined('url.id') and #url.id# EQ #current_posts.blID#>
    <img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="Current Blog Posts" width="7" height="12">
    &nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog&dopost=yes&id=#current_posts.blID#&#current_posts.bltitle#" class="menu_items">#current_posts.bltitle#</a></b><br />
    <cfelse>
    <img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="Current Blog Posts" width="7" height="12">
    &nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog&dopost=yes&id=#current_posts.blID#&#current_posts.bltitle#" class="menu_items">&nbsp;#current_posts.bltitle#</a><br />
      </cfif>     
  </cfloop>
  </cfoutput>
</div>
<br /><br />
<br /><br />
<br /><br />
<br /><br />