<div id="menu_box_title">
Articles Archive
</div>
<div id="menu_box">
<cfoutput>
    <cfloop query="GetArticles_Archived">
    <cfif isDefined('url.archive_id') and #url.archive_id# EQ #article_id#>
    <img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet_active.jpg" alt="article_archives" width="7" height="12">
    &nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&section=archives&archive_id=#article_id#" class="menu_items">&nbsp;#article_title#</a></b><br />
    <cfelse>
    <img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="article_archives" width="7" height="12">
    <a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&section=archives&archive_id=#article_id#" class="menu_items">&nbsp;#article_title#</a><br />
    </cfif>
    </cfloop>
</cfoutput>
</div>
<br /><br />
<br /><br />
<br /><br />
<br /><br />