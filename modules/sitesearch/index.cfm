<!---\\ Module Configuration //--->
<cfset module ="sitesearch">
<!---\\ End of Module Configuration //---->
<form name="site_search" method="post" action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=sitesearch">
<table width="277" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search_left.jpg" />
  </td>
   <td><img name="indexcfm_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c1.jpg" width="117" height="35" border="0" id="indexcfm_r1_c1" alt="" /></td>
   <td><img name="indexcfm_r1_c2" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c2.jpg" width="27" height="35" border="0" id="indexcfm_r1_c2" alt="" /></td>
   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="91">
	  <tr>
	   <td><img name="indexcfm_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c3.jpg" width="91" height="7" border="0" id="indexcfm_r1_c3" alt="" /></td>
	  </tr>
	  <tr>
	   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="91">
		  <tr>
		   <td><input type="text" name="keywords" id="keywords" style="width:82px;height:16px; border-top:1px solid #000; border-left: 0px solid #000; border-right: 0px solid #000; border-bottom: 1px solid #000; font-size:9px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#033260;font-weight:bold;" value="Search Us" onfocus="document.site_search.keywords.value=
'';"/></td>
		   <td><img name="indexcfm_r2_c4" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r2_c4.jpg" width="9" height="20" border="0" id="indexcfm_r2_c4" alt="" /></td>
		  </tr>
		</table></td>
	  </tr>
	  <tr>
	   <td><img name="indexcfm_r3_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r3_c3.jpg" width="91" height="8" border="0" id="indexcfm_r3_c3" alt="" /></td>
       
	  </tr>
	</table></td>
   <td><a href="#" onclick="document.site_search.submit();" onmouseout="MM_swapImgRestore();" onmouseover="MM_swapImage('indexcfm_r1_c5','','<cfoutput>#site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c5_f2.jpg',1);"><img name="indexcfm_r1_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c5.jpg" width="42" height="35" border="0" id="indexcfm_r1_c5" alt="" /></a></td>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search_right.jpg" />
  </td>
  </tr>
</table>
</form>