WebOS Documentation:
     Section 1.0 Introduction
	 Section 1.1 Thanks and Acknowledgements
	 Section 2.0 Site Structure
	 Section 2.1 Data Bases
	 Section 3.0 Modules 
	 Section 4.0 Templates
	 Section 5.0 Adminstration
	 Section 6.0 Installation
	 

SECTION 1.0 : INTRODUCTION

WebOS was developed because of the need for an easy to edit, install and administrate
content management system in ColdFusion. The Company I was working for had an aging 
'Legacy'-based CMS, which was at the best, difficult if not tedious to install, update
and modify.

WebOS solves all of the tediousness and difficulties in running and administrating a
Dynamic ColdFusion CMS.

With an easy-to-use Administration Panel, anyone with a little knowledge can use and 
administrate WebOS.

WebOS is a module-based CMS with a template structure used to change the site layout easily
without extensive HTML knowledge.

WebOS comes out-of-the-box per say with a wide variety of modules:
-Google Analytics, -Article Manager, -Banner Manager, -Blog, -Chat System, 
-DidyouKnow Module, -Image Gallery, -Customizable Contact Form, -Links Directory,
-Meta Tag Generator, -News Manager, -Page Editor, -PodCast Library, -Polls & Surveys,
-Mortgage Rates Ticker, -RSS Feeds, -Search Engine Friendly URLS, -SiteMap, -Site Search,
-Spotlights Manager, -TaxForms Search and -Download Manger, -Tell-a-Friend Manager, 
ZipCode Search Utlitiy...

Having this Modular architecture makes WebOS easy to install, modify and use!	

WebOS was Developed Originally By James Harvey (jharvey@moxymedia.com)

WebOS is available online:
http://webos.riaforge.org/
http://alterepdixels.net/files/webos.zip

SECTION 1.1 : THANKS & ACKNOWLEDGEMENTS

First and Foremost, Edward Beckett, and Robert Pino, for thier suggestions, feedback and
creative critisism. 

To Ray Camden, for which I could not have built the blog section of WebOS, as it is loosely
based off of blogcfc;

To My Wife Katherine for her unyeilding support and 'git'rdone' attitude.

Additional Thanks goes to: Frank Riviero for the inital Concept of 'Spotlights' and 'PodCasts'; Hayward Boddie for the idea of the 'Poll System'; 
A Special Thanks goes out to 'hockeypfef' for pointing out a great deals of 'glitches' in the webos RC development, and for his/her feedback on the webos project page.

SECTION 2.0 : SITE STRUCTURE

As mentioned in the introduction, WebOS has a modular framework, making it easy to modify and
customize. The Current site Structure is as follows:

ROOT
 |- DOCS
 |- ADMIN (This is the folder for the WEBOS Adminsitration Panel)
 |- DB (This folder hold the database structure and table information)
 |- FUNCTIONS (General Core Fucntions are housed here)
 |- INSTALL (Installation Script
 |- MODULES (This houses all of the WebOS Modules, each module has thier own folder)
 |- TEMPLATES (This houses the different Template Layouts for the WEBOS SYSTEM)
 
While you're browsing the code source, you'll note two different types of Commenting:

Comments that are informative or descriptive: 
<!---\\ Comments looking like this tell you soemthing //--->

Debugging or obsolete functions:
<!---SOMECODEBASED HERE--->

SECTION 2.1 : DATA BASES
Located in the functions/ folder is a file called webos_tables.cfm. This File contains all the 
defines for the webos Database Tables. IT DOES NOT CONTAIN the database structure. If Adding a new
Module that requires it's own database table, define it in the webos_tables.cfm and structure your
query like so:

<cfquery name="getstock" datasource="#datasrc#">
SELECT TOP 3 ticker_id, ticker_company, ticker_symbol
FROM #table_stocks# 
ORDER BY ticker_company ASC
</cfquery>

Now there are two ways of adding additional tables to the system:
Global Method: 
Add your cfset table definitions to the functions/webos_tables.cfm file.

Per Module Method:
(Please Note we recommend using the global method)
If your module needs only specific tables, and doesn't need to interact with other tables,
in the index.cfm of the module (modules/mod_name/index.cfm) you will notice something to the like of:
<!---\\ Module Configuration //--->
<cfset module ="bmi_profile">

<!---\\ End of Module Configuration //---->

You can simply add your table definitions there like so:
<cfset table_bmi_quiz = "webos_bmi_quiz">
<cfset table_bmi_goals ="webos_bmi_goals">
<cfset table_bmi_log ="webos_bmi_progress_log">

PLEASE NOTE: WE STRONGLY RECOMMEND USING THE GLOBAL METHOD!!!

SECTION 3.0 : MODULES

SECTION 4.0 : TEMPLATES 
A Quick Heads up note about the Templates:
To begin, all of the templates for all of the site's features and modules are pre-coded for
SearchEngine Friendly URLS, whether or not you choose to have the module activated or not.
This is done to minimize redundancy in the code.

SECTION 5.0 : ADMINSITRATION

SECTION 6.0 : INSTALLATION
Please Read the file: install_webos.txt