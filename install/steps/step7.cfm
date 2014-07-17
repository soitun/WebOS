<cfoutput>
<!---\\ Step 7: Database Creation //--->

  <form name="step7" action="?step=7&sql=insert" method="post">
   <input type="hidden" name="site_domain" value="#form.site_domain#"/>
       <input type="hidden" name="site_folder" value="#form.site_folder#" />
       <input type="hidden" name="site_name" value="#form.site_name#" />
       <input type="hidden" name="site_mail_server" value="#form.site_mail_server#" />
       <input type="hidden" name="site_email" value="#form.site_email#" />
       <input type="hidden" name="site_license" value="#form.site_license#" />
       <input type="hidden" name="site_type" value="#form.site_type#" />
       <input type="hidden" name="site_location" value="#form.site_location#" />
       <input type="hidden" name="client_name" value="#form.client_name#" />
       <input type="hidden" name="client_email" value="#form.client_email#" />
       <!---\\ From Step 3 //--->
       <input type="hidden" name="site_template" value="#form.site_template#" />
       <input type="hidden" name="site_template_dir" value="#form.site_template_dir#" />
       <input type="hidden" name="site_admin_dir" value="#form.sitE_admin_dir#" />
       <input type="hidden" name="site_modules_dir" value="#form.site_modules_dir#" />
       <input type="hidden" name="site_assets_dir" value="#form.site_assets_dir#" />
       <input type="hidden" name="site_header" value="#form.site_header#" />
       <input type="hidden" name="site_footer" value="#form.site_footer#" />
       <input type="hidden" name="site_width" value="#form.sitE_width#" />
       <input type="hidden" name="left_col_active" value="#form.left_col_active#" />
       <input type="hidden" name="left_col_width" value="#form.left_col_width#" />
       <input type="hidden" name="site_side_boxes" value="#form.site_side_boxes#" />
       <input type="hidden" name="right_col_active" value="#form.right_col_active#" />
       <input type="hidden" name="right_col_width" value="#form.right_col_width#" />

       <input type="hidden" name="site_header_dir" value="#form.site_header_dir#" />
       <input type="hidden" name="site_footer_dir" value="#form.site_footer_dir#" />
       <input type="hidden" name="site_scripts_dir" value="#form.site_scripts_dir#" />
       <input type="hidden" name="site_style_sheet" value="#form.site_style_sheet#" />
       <input type="hidden" name="site_styles_dir" value="#form.site_styles_dir#" />
       <input type="hidden" name="template_file" value="#form.template_file#" />
       <!---\\ From Step 4 //--->
       <input type="hidden" name="analytics" value="#form.analytics#" />
       <input type="hidden" name="articles" value="#form.articles#" />
       <input type="hidden" name="banners"  value="#form.banners#"/>
       <input type="hidden" name="blog" value="#form.blog#" />
       <input type="hidden" name="breadcrumbs" value="#form.breadcrumbs#" />
       <input type="hidden" name="chat" value="#form.chat#" />
       <input type="hidden" name="didyouknow"  value="#form.didyouknow#"/>
       <input type="hidden" name="forum" value="#form.forum#" />
       <input type="hidden" name="inquiry" value="#form.inquiry#" />
       <input type="hidden" name="links" value="#form.links#" />
       <input type="hidden" name="mainpage" value="#form.mainpage#" />
       <input type="hidden" name="metatags" value="#form.metatags#" />
       <input type="hidden" name="newsletter" value="#form.newsletter#"/>
       <input type="hidden" name="pages" value="#form.pages#" />
       <input type="hidden" name="podcasts"  value="#form.podcasts#"/>
       <input type="hidden" name="polls"  value="#form.polls#"/>
       <input type="hidden" name="ratesticker"  value="#form.ratesticker#"/>
       <input type="hidden" name="rss" value="#form.rss#" />
       <input type="hidden" name="sefurls"  value="#form.sefurls#"/>
       <input type="hidden" name="sitemap"  value="#form.sitemap#"/>
       <input type="hidden" name="sitesearch"  value="#form.sitesearch#"/>
       <input type="hidden" name="spotlights"  value="#form.spotlights#"/>
       <input type="hidden" name="stockticker"  value="#form.stockticker#"/>
       <input type="hidden" name="tellafriend"  value="#form.tellafriend#"/>
       <input type="hidden" name="users" value="#form.users#" />
	   <!---\\ From Step 5 //--->
       <input type="hidden" name="datasrc" value="#form.datasrc#" />
  </form>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
    </tr>
    <tr>
      <td width="2%">&nbsp;</td>
      <td width="96%" valign="top">


<cfif not isDefined('url.sql') or isDefined('url.sql') and #url.sql# EQ "">
 Please Wait as We Begin Creating your Database Tables...<br />
      <center>
<script type="text/javascript">
var bar1= createBar(300,10,'white',1,'black','##033364',85,7,10,"");
</script>
</center>
<cftransaction>
<!---\\ We had originally had all of these in one file, however the single query was too large to run, so we broke the create tables .sql file into separate files //--->

<cffile action="read" file="#form.site_location#\db\admin_news.sql" variable="adminnews_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#adminnews_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\admins.sql" variable="admins_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#admins_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\analytics.sql" variable="analytics_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#analytics_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\articles.sql" variable="articles_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#articles_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\banners.sql" variable="banners_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#banners_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\blog.sql" variable="blog_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#blog_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\chat.sql" variable="chat_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#chat_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\config.sql" variable="config_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#config_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\dyk.sql" variable="dyk_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#dyk_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\forum.sql" variable="forum_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#forum_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\inquiry.sql" variable="inquiry_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#inquiry_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\links.sql" variable="links_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#links_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\mainpage.sql" variable="mainpage_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#mainpage_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\metatags.sql" variable="metatags_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#metatags_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\modules.sql" variable="modules_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#modules_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\newsletters.sql" variable="newsletters_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#newsletters_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\pages.sql" variable="pages_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#pages_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\podcasts.sql" variable="podcasts_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#podcasts_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\polls.sql" variable="polls_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#polls_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\rss.sql" variable="rss_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#rss_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\stocks.sql" variable="stock_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#stock_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\taxes.sql" variable="tax_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#tax_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\sitesearch.sql" variable="sitesearch_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#sitesearch_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\spotlights.sql" variable="spotlights_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#spotlights_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\users.sql" variable="users_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#users_sql#
</cfquery>
</cftransaction>
 <table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step7.submit();" class="Button">Populate the Database</a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>

<cfelseif isDefined('url.sql') and #url.sql# EQ "insert">
<form name="step7_5" action="?step=8" method="post">
   <input type="hidden" name="site_domain" value="#form.site_domain#"/>
       <input type="hidden" name="site_folder" value="#form.site_folder#" />
       <input type="hidden" name="site_name" value="#form.site_name#" />
       <input type="hidden" name="site_mail_server" value="#form.site_mail_server#" />
       <input type="hidden" name="site_email" value="#form.site_email#" />
       <input type="hidden" name="site_license" value="#form.site_license#" />
       <input type="hidden" name="site_type" value="#form.site_type#" />
       <input type="hidden" name="site_location" value="#form.site_location#" />
       <input type="hidden" name="client_name" value="#form.client_name#" />
       <input type="hidden" name="client_email" value="#form.client_email#" />
       <!---\\ From Step 3 //--->
       <input type="hidden" name="site_template" value="#form.site_template#" />
       <input type="hidden" name="site_template_dir" value="#form.site_template_dir#" />
       <input type="hidden" name="site_admin_dir" value="#form.sitE_admin_dir#" />
       <input type="hidden" name="site_modules_dir" value="#form.site_modules_dir#" />
       <input type="hidden" name="site_assets_dir" value="#form.site_assets_dir#" />
       <input type="hidden" name="site_header" value="#form.site_header#" />
       <input type="hidden" name="site_footer" value="#form.site_footer#" />
       <input type="hidden" name="site_width" value="#form.sitE_width#" />
       <input type="hidden" name="left_col_active" value="#form.left_col_active#" />
       <input type="hidden" name="left_col_width" value="#form.left_col_width#" />
       <input type="hidden" name="site_side_boxes" value="#form.site_side_boxes#" />
       <input type="hidden" name="right_col_active" value="#form.right_col_active#" />
       <input type="hidden" name="right_col_width" value="#form.right_col_width#" />

       <input type="hidden" name="site_header_dir" value="#form.site_header_dir#" />
       <input type="hidden" name="site_footer_dir" value="#form.site_footer_dir#" />
       <input type="hidden" name="site_scripts_dir" value="#form.site_scripts_dir#" />
       <input type="hidden" name="site_style_sheet" value="#form.site_style_sheet#" />
       <input type="hidden" name="site_styles_dir" value="#form.site_styles_dir#" />
       <input type="hidden" name="template_file" value="#form.template_file#" />
       <!---\\ From Step 4 //--->
       <input type="hidden" name="analytics" value="#form.analytics#" />
       <input type="hidden" name="articles" value="#form.articles#" />
       <input type="hidden" name="banners"  value="#form.banners#"/>
       <input type="hidden" name="blog" value="#form.blog#" />
       <input type="hidden" name="breadcrumbs" value="#form.breadcrumbs#" />
       <input type="hidden" name="chat" value="#form.chat#" />
       <input type="hidden" name="didyouknow"  value="#form.didyouknow#"/>
       <input type="hidden" name="forum" value="#form.forum#" />
       <input type="hidden" name="inquiry" value="#form.inquiry#" />
       <input type="hidden" name="links" value="#form.links#" />
       <input type="hidden" name="mainpage" value="#form.mainpage#" />
       <input type="hidden" name="metatags" value="#form.metatags#" />
       <input type="hidden" name="newsletter" value="#form.newsletter#"/>
       <input type="hidden" name="pages" value="#form.pages#" />
       <input type="hidden" name="podcasts"  value="#form.podcasts#"/>
       <input type="hidden" name="polls"  value="#form.polls#"/>
       <input type="hidden" name="ratesticker"  value="#form.ratesticker#"/>
       <input type="hidden" name="rss" value="#form.rss#" />
       <input type="hidden" name="sefurls"  value="#form.sefurls#"/>
       <input type="hidden" name="sitemap"  value="#form.sitemap#"/>
       <input type="hidden" name="sitesearch"  value="#form.sitesearch#"/>
       <input type="hidden" name="spotlights"  value="#form.spotlights#"/>
       <input type="hidden" name="stockticker"  value="#form.stockticker#"/>
       <input type="hidden" name="tellafriend"  value="#form.tellafriend#"/>
       <input type="hidden" name="users" value="#form.users#" />
	   <!---\\ From Step 5 //--->
       <input type="hidden" name="datasrc" value="#form.datasrc#" />
  </form>
Please Wait as we populate the database tables...<br />
      <center>
<script type="text/javascript">
var bar1= createBar(300,10,'white',1,'black','##033364',85,7,10,"");
</script>
</center>
<!---\\ This Populates the Most minimal of information from the webos_data.sql file //--->
<cftransaction>
<!---<cffile action="read" file="#form.site_location#\db\webos_test.sql" variable="test_sql">--->
<cfquery name="populate_tables" datasource="#form.datasrc#">
INSERT webos_company_info (company_name, company_address, company_address_2, company_tollfree, company_phone, company_fax, company_city, company_state, company_zip) VALUES ('WebOS', '9522 Royal Palm Blvd.', '', '888.555.1212', '954.496.1485', '', 'Coral Springs', 'FL', '33065')

SET IDENTITY_INSERT webos_config_sidebox ON

INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (1, 'Articles', 'articles.cfm', 'left', '0','0')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (2, 'Articles Archive', 'articles_archives.cfm', 'left', '0','1')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (3, 'Current Blog Posts', 'blog_posts.cfm', 'left', '0','3')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (4, 'Did You Know...', 'dyk.cfm', 'left', '0','4')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (5, 'Newsletter Subscription', 'newsletters.cfm', 'left', '0','0')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (6, 'Site Pages', 'pages_menu.cfm', 'right', '0','0')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (7, 'Available Sections', 'site_modules.cfm', 'right', '0','0')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (8, 'Site Search', 'site_search.cfm', 'right', '0','0')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (9, 'Stock Quotes', 'stock_quotes.cfm', 'right', '0','0')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position) VALUES (10, 'User Profile', 'user_login.cfm', 'right', '0','0')
SET IDENTITY_INSERT webos_config_sidebox OFF

SET IDENTITY_INSERT webos_metatags ON

INSERT webos_metatags (meta_id, meta_subject, meta_description, meta_keywords, meta_language, meta_expires, meta_abstract, meta_site_name, meta_revisit, meta_distribution, meta_bots, meta_googlebot, meta_msnbot) VALUES (1, 'ColdFusion CMS', 'WebOS: Coldfusion Website Operating System', 'Coldfusion, CMS, Website, Content Management, Blog, Google Analytics, articles, banners, chat,', 'English', 'Never', 'WebOS: Coldfusion Website Operating System', 'WebOS Development Site', '4 Days', 'Global', 'Index', 'Index', 'Index')

SET IDENTITY_INSERT webos_metatags OFF



SET IDENTITY_INSERT webos_config ON

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (1, 'Site Configured', 'site_configured', '1', 'Tells the System if the WebOS System has been configured', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (2, 'Site License', 'site_license', 'WEBOS_001_RC1_A', 'License Key for WebOS', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (3, 'Site Name', 'site_name', 'WebOS: Development CMS', 'Title of your Website', 'SYSTEM', 1, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (4, 'Site Type', 'site_type', 'dev_website', 'Type of Site WebOS is running', 'SYSTEM', 2, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (5, 'Site Admin Dir', 'site_admin_dir', 'admin/', 'The Location of the Admin Directory', 'SYSTEM', 3, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (6, 'Site Modules Dir', 'site_modules_dir', 'modules/', 'the Location of the Modules Directory', 'SYSTEM', 4, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (7, 'Site Location', 'site_location', 'C:\Inetpub\wwwroot\_local_dev/_webos/', 'The Path on Server of the WebOS Installation', 'SYSTEM', 5, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (8, 'Client Name', 'client_name', 'James Harvey: Development', 'The Name of the Client for WebOS', 'SYSTEM', 6, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (9, 'Client Email', 'client_email', 'jharvey@moxymedia.com', 'The Email address of the Client', 'SYSTEM', 7, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (10, 'Site Team', 'site_team', 'dev', 'The Team Developing the Website', 'SYSTEM', 8, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (11, 'Site Email', 'site_email', 'jharvey@moxymedia.com', 'The Email of the Team Developing the Website', 'SYSTEM', 9, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (12, 'Data Source', 'datasrc', 'MassDevelopment001', 'The Datasource for WebOS databases', 'SYSTEM', 10, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (13, 'Site Template', 'site_template', 'MoxyMedia', 'The Default Template Layout for the Site', 'TEMPLATES', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (14, 'Site Header', 'site_header', 'header.cfm', 'Your Header for the Website', 'TEMPLATES', 1, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (15, 'Site Footer', 'site_footer', 'footer.cfm', 'Your Footer for the Website', 'TEMPLATES', 2, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (16, 'Site Width', 'site_width', '780', 'The Width of your Website (Pixels or Percent %)', 'TEMPLATES', 3, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (17, 'Left Column Active', 'left_col_active', '1', 'Activate/DeActivate the Left Column of your Website', 'TEMPLATES', 4, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (18, 'Left Column Width', 'left_col_width', '180', 'The Width of your Left Column', 'TEMPLATES', 5, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (19, 'Right Column Active', 'right_col_active', '0', 'Activate/DeActivate the Right Column of your Template', 'TEMPLATES', 6, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (20, 'Right Column Width', 'right_col_width', '180', 'The Width of your Right Column', 'TEMPLATES', 7, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (21, 'Reinitialization Code', 'reinit_code', 'WEBOS_CF_2007', 'The Reinstallation code for re-running the Installer', 'SYSTEM', 11, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (24, 'Site Headers Dir', 'site_header_dir', 'headers/', 'The Location of the Headers Directory', 'TEMPLATES', 8, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (23, 'Site Templates Dir', 'site_template_dir', 'templates/', 'The Location of the Templates Directory', 'SYSTEM', 12, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (25, 'Site Footers Dir', 'site_footer_dir', 'footers/', 'The Location of the footers Directory', 'TEMPLATES', 9, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (26, 'Site Assets Dir', 'site_assets_dir', 'assets/', 'The Location of the Assets directory that holds your site images, scripts and styles', 'TEMPLATES', 10, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (27, 'Site Scripts Dir', 'site_scripts_dir', 'scripts/', 'the Location of your JavaScripts Directory insite of your Site Assets Folder', 'TEMPLATES', 11, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (28, 'Site Styles Dir', 'site_styles_dir', 'styles/', 'The Location of your Site Styles Sheets directory inside of your Site Assets Directory', 'TEMPLATES', 12, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (29, 'Site Style Sheet', 'site_style_sheet', 'default.css', 'The Name of the Style Sheet for your site', 'TEMPLATES', 13, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (30, 'Right Column Dir', 'site_right_col', 'right_col/', 'The Name of the directory that holds all of the Modules for the Right Column', 'TEMPLATES', 14, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (31, 'Side Boxes Dir', 'site_sidebox_dir', 'side_boxes/', 'The Name of the Directory holding all the modules Side Boxes', 'TEMPLATES', 15, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (32, 'Site Domain ', 'site_domain', 'localhost/', 'The Name of the Domain where the System resides', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (33, 'Mail Server', 'site_mail_server', 'mail.swidigital.com', 'The Name of your Mail Server. (i.e., mail.yoursite.com)', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (34, 'Mail Server Username', 'site_mail_user', 'j.harvey@swidigital.com', 'Your Username for your mail server', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (35, 'Mail Server Password', 'site_mail_pass', 'jch1701', 'Your Password for your mail server ', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (36, 'Site Folder', 'site_folder', '_local_dev/_webos/', 'The Folder Under the Domain where the system is installed', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (37, 'Send HTML Email', 'send_html_email', '1', 'Set to ''1'' to Send HTML Emails. Otherwise, Set to ''0''', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (38, 'Template Index', 'template_file', 'index.cfm', 'The index file for the Template', 'TEMPLATES', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (39, 'Website ID', 'website_id', '0001', 'The ID Number of the Website Running WebOS', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (41, 'RSS Feeds Logo', 'rss_logo', 'moxy_rss.jpg', 'The Logo of your Website, Displayed for RSS Feeds Module', 'TEMPLATES', 1, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (42, 'RSS Feeds Logo Directory', 'rss_logo_dir', 'rss_logo/', 'The Directory for your RSS Feeds Logo', 'TEMPLATES', 1, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (43, 'WebOS Version', 'webos_version', '1.25', 'The Version of WebOS', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (40, 'Website Category ID', 'website_cat_id', '0001', 'The Category ID of the Site Type', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (41, 'Display Company Information on Contact Page', 'inquiry_show_info', '1', 'Enable/Disable Viewing of Company Information on Contact Page', 'SYSTEM', 0, NULL)

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (42, 'Enable Dynamic Page Titles on Webiste', 'show_page_titles', '1', 'Enables display of Page Titles in your Browser', 'SYSTEM', 0, NULL)
SET IDENTITY_INSERT webos_config OFF



SET IDENTITY_INSERT webos_mainpage ON

INSERT webos_mainpage (main_page_id, main_page_title, main_page_content, main_page_time_sensitive, main_page_start_date, main_page_expire_date, main_page_active) VALUES (1, 'WebOS'' MainPage Goes Dynamic', 'This is a demo site powered by WebOS. Based on Coldfusion with a

template technology and integrated with a MSSQL database, it is a fully

functional Site Engine that allows you to try WebOS. <p justify\="" align="\"><b>This service is for demo purposes only.</b> No real content. No real polls. No real anything. Please do however, work with and use the WebOS system.</p> <p justify\="" align="\">To replace this text with a welcome message of your own, log in to the <a href="admin/index.cfm">administration panel</a>, and in the left hand menu, select, Modules, MainPage under the Site Configuration menu.</p><p justify\="" align="\">If you see an Expiration date in the lower right-hand corner, a new page will be displayed on that date. <br></p><br>', 1, '', '', 1)

SET IDENTITY_INSERT webos_mainpage OFF



SET IDENTITY_INSERT webos_modules ON

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (1, 'Google Analytics', 'Enables Google Analytics for your Website', 1, 0, '', 'analytics', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (2, 'Articles', 'Enables you to have Articles on your Website', 1, 0, 'left', 'articles', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (3, 'Banners', 'Enables Banners on your website', 0, 0, 'left', 'banners', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (4, 'Blog', 'Enables a Web Blog on your site', 1, 3, 'left', 'blog', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (5, 'Chat', 'Enables a Chat System on your Site for either Users or For Live Support', 1, 4, 'left', 'chat', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (6, 'Did you Knows', 'Have Randomized ''Did You Know'' content on your website', 1, 2, '', 'didyouknow', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (8, 'Links Directory', 'Enables your site to have a Links Directory', 1, 5, 'left', 'links', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (9, 'Meta Tags', 'Inserts Pre-Optimized Meta Tags for your Website', 1, 0, '', 'metatags', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (11, 'Pages', 'Create and Update Content Pages for your Website', 1, 1, 'center', 'pages', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (12, 'PodCasts', 'Enable PodCasts for your Website', 1, 0, 'left', 'podcasts', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (13, 'Polls', 'Enable Polling & Surveys on your Website', 1, 0, 'left', 'polls', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (14, 'Rate Ticker', 'Mortgage rates Ticker for Financial-type Websites', 0, 0, '', 'ratesticker', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (15, 'RSS Feeds', 'Enables RSS Feeds for your Website', 1, 0, 'left', 'rss', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (16, 'SEO Friendly URLS', 'Enables SEF URLs for your website', 0, 0, '', 'sefurls', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (17, 'Sitemap', 'Generates an easy to Follow Site Map', 1, 0, 'footer', 'sitemap', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (18, 'Site Search', 'Enables a Search Egnie for your Website', 1, 0, 'header', 'sitesearch', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (19, 'Spotlights', 'Have Spotlighted Content Displayed on your website', 1, 0, '', 'spotlights', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (20, 'Tax Forms', 'Tax Form Search and Download Utility for Financial-type Sites', 0, 0, 'left', 'taxforms', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (21, 'Tell-A-Friend', 'Have users tell friends about features on your website', 1, 0, 'right', 'tellafriend', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (22, 'Stock Ticker', 'Scrolling Stock Ticker', 0, 0, 'left', 'stockticker', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (23, 'Main Page', 'Your Main (or Home) Page', 1, 1, 'center', 'mainpage', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (24, 'Inquiry Form', 'Fully Customizable Contact Form for Your Website', 1, 0, 'center', 'inquiry', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (25, 'Forum', 'Enables your WebOS System to have a Forum', 1, 0, 'left', 'forum', 1)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (26, 'Breadcrumbs', 'Easy Navigation Links so your users can easily navigate your Website', 1, 0, 'center', 'breadcrumbs', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (27, 'Zip Search', 'Enables your site to use a Zip Search Utility', 0, 0, 'center', 'zipsearch', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (28, 'User Profiles', 'Enables Users to Sign-up and Create a Profile for your site', 1, 0, 'center', 'users', 0)

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (29, 'Newsletter', 'Enables your site to have a Newsletter Subscription System', 1, 0, 'center', 'newsletter', 1)

SET IDENTITY_INSERT webos_modules OFF

INSERT webos_company_hours (hours_monday, hours_tuesday, hours_wednesday, hours_thursday, hours_friday, hours_saturday, hours_sunday) VALUES ('9am-5pm', '9am-5pm', '9am-5pm', '9am-5pm', '9am-5pm', 'Closed', 'Closed')

SET IDENTITY_INSERT webos_our_rss_feeds ON
INSERT webos_our_rss_feeds (rss_id, rss_title, rss_content, rss_created, rss_author, rss_author_email, rss_status, rss_weight) VALUES (1, 'WebOS Rss Feeds Go Live!' , 'Test of Time shall Prevail.<br>' , CAST(0x000099E000000000 AS DateTime), 'WebOS Admin' , 'jharvey@moxymedia.com' , 1, 0)
INSERT webos_our_rss_feeds (rss_id, rss_title, rss_content, rss_created, rss_author, rss_author_email, rss_status, rss_weight) VALUES (3, 'WebOS Debugs and Verifies it''s RSS Feeds!' , 'That''s Right! Our RSS Feeds are now verified and RSS 2.0 Compliant! <br>' , CAST(0x000099D100000000 AS DateTime), 'Admin' , 'jchharvey@moxymedia.com' , 1, 1)
INSERT webos_our_rss_feeds (rss_id, rss_title, rss_content, rss_created, rss_author, rss_author_email, rss_status, rss_weight) VALUES (4, 'WebOS Automates RSS Creation' , 'WebOS now automated the RSS XML File it generates, each time a local-content RSS Feed is added, editted or deleted. This takes one-step out of generating a RSS XML after adding a new RSS topic.<br>' , CAST(0x000099D200000000 AS DateTime), 'WebOS Admin' , 'jharvey@moxymedia.com' , 1, 2)
SET IDENTITY_INSERT webos_our_rss_feeds OFF

SET IDENTITY_INSERT webos_rss_config ON
INSERT webos_rss_config (rss_config_id, randomize_feeds, random_feed_value) VALUES (1, 0, 0)
SET IDENTITY_INSERT webos_rss_config OFF

SET IDENTITY_INSERT webos_rss_feeds ON
INSERT webos_rss_feeds (rss_id, rss_title, rss_content, rss_status, rss_weight) VALUES (4, 'NY Times World News' , 'http://www.nytimes.com/services/xml/rss/nyt/International.xml' , 1, 0)
INSERT webos_rss_feeds (rss_id, rss_title, rss_content, rss_status, rss_weight) VALUES (5, 'NY Times Automotive News' , 'http://www.nytimes.com/services/xml/rss/nyt/Automobiles.xml' , 1, 1)
SET IDENTITY_INSERT webos_rss_feeds OFF


SET IDENTITY_INSERT webos_spotlights ON
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire) VALUES (1, 'WebOS Spotlight', 'WebOS Spotlights Module can be used to highlight new features, articles, news Topics, or anyhting you care to highlight on your site''s main page!<br><br><img src="http://localhost/_local_dev/_webos/admin/_assets/_icons/icon_edit_topic.gif" alt="include images too" align="absmiddle" border="0" hspace="0" vspace="0">And Yes you can even include images...<br>', 0, CAST(0x00009CA900000000 AS DateTime), CAST(0x00009E1500000000 AS DateTime))
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire) VALUES (2, 'WebOS is Versatile', 'WebOS has been developed to be extremely verstaile and incredibly customizable...', 0, CAST(0x00009CA900000000 AS DateTime), CAST(0x00009E1500000000 AS DateTime))
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire) VALUES (3, 'WebOS is Fully Customizable!', 'You can Customize WebOS to easily look like your current Website with our Easy to use and Edit Templates!', 0, CAST(0x00009CA900000000 AS DateTime), CAST(0x00009E1500000000 AS DateTime))
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire) VALUES (4, 'More Default Modules than any other CMS! ', 'Currently, WebOs comes out-of-the box with over 20 standard Modules!<br>That''s Right!<br> How many other CMS Systems come with an integrated Chat, Forums, Search Engine Friednly ULS, Image Gallery, and RSS Feeds!', 0, CAST(0x00009CA900000000 AS DateTime), CAST(0x00009E1500000000 AS DateTime))
SET IDENTITY_INSERT webos_spotlights OFF

SET IDENTITY_INSERT webos_pages ON
INSERT webos_pages (page_id, page_title, page_content, page_in_menu, page_status, weight) VALUES (1, 'About WebOS', 'WebOs was developed because of the need for an easy to edit, install and administrate content management system in ColdFusion. The Company I was working for had an aging ''Legacy''-based CMS, which was at the best, difficult if not tedious to install, update and modify.<br><br>WebOS solves all of the tediousness and difficulties in running and administrating a Dynamic ColdFusion CMS.<br><br>With an easy-to-use Administration Panel, anyone with a little knwledge can use and administrate WebOS. <br><br>WebOS is a module-based CMS with a template structure used to change the site layout easily without extensive HTML knowledge.<br><br>WebOS comes out-of-the-box per say with a wide variety of modules:<br>Google Analytics, Article Manager, Banner Manager, Blog, BreadCrumb Navigation, Chat System, Did-you-Know Module, Forum, Image Gallery, Customizable Contact Form, Links Directory, Meta Tag Generator, News Manager, Page Editor, PodCast Library, Polls &amp; Surveys, Mortgage Rates Ticker, RSS Feeds, Search Engine Friendly URLS, SiteMap, Site Search, Spotlights Manager, TaxForms Search and Download Manger, Tell-a-Friend Manager.<br><br>Having this Modular architecture makes WebOS easy to install, modify and use!<br>', 1, 1, 0)
SET IDENTITY_INSERT webos_pages OFF

SET IDENTITY_INSERT webos_sitesearch ON
INSERT webos_sitesearch (search_config_id, search_in, search_in_value) VALUES (1, 'articles', 1)
INSERT webos_sitesearch (search_config_id, search_in, search_in_value) VALUES (2, 'pages', 1)
INSERT webos_sitesearch (search_config_id, search_in, search_in_value) VALUES (3, 'blog', 1)
INSERT webos_sitesearch (search_config_id, search_in, search_in_value) VALUES (4, 'links', 1)
INSERT webos_sitesearch (search_config_id, search_in, search_in_value) VALUES (5, 'rss', 1)
INSERT webos_sitesearch (search_config_id, search_in, search_in_value) VALUES (6, 'forum', 1)
SET IDENTITY_INSERT webos_sitesearch OFF

SET IDENTITY_INSERT webos_inquiry_subjects ON
INSERT webos_inquiry_subjects (subject_id, subject) VALUES (1, 'General Inquiry')
INSERT webos_inquiry_subjects (subject_id, subject) VALUES (2, 'Website Issues')
INSERT webos_inquiry_subjects (subject_id, subject) VALUES (3, 'Technical Support')
INSERT webos_inquiry_subjects (subject_id, subject) VALUES (4, 'Advertising Information')
SET IDENTITY_INSERT webos_inquiry_subjects OFF

</cfquery>
</cftransaction>
<table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step7_5.submit();" class="Button">Step 8 >></a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
</cfif>
</td>
</tr>
</table>
</cfoutput>