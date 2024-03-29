
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Your Opinion :: Polls</td>
</tr>
  <tr>
    <td height="25" align="center" colspan="2">
   <!--- Check for a cookie for the poll --->

<cfif IsDefined("cookie.fusionpoll")>

<!--- What to do if the cookie does exist --->
<!--- Check now to see if the cookie is current - does it have the correct ID? --->

	<cfquery datasource="#datasrc#" name="CurrentID" MAXROWS="1">
	SELECT questions.QuestionID
	FROM #table_poll_q# questions
    where SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
	ORDER BY QuestionID DESC
	</cfquery>

<cfif "#cookie.fusionpoll#" is "#CurrentID.QuestionID#">

<!--- What to do if the cookie is current --->
<!--- Query the question and the total number of votes for all the answers. --->

    <cfquery datasource="#datasrc#" name="Totals">
    SELECT questions.Question, SUM(answers.Votes) AS TotalVotes 
	FROM #table_poll_q# questions INNER JOIN #table_poll_a# answers 
	ON questions.QuestionID=answers.QuestionID 
	WHERE questions.QuestionID=#cookie.fusionpoll# 
    AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
    GROUP BY questions.Question 
    </cfquery>
	
<!--- Query the answers. and the number of votes for each one. --->

    <cfquery datasource="#datasrc#" name="Results">
    SELECT answers.Answer, answers.Votes 
	FROM #table_poll_a# answers 
	WHERE answers.QuestionID=#cookie.fusionpoll# 
    AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
	ORDER BY answers.AnswerID 
    </cfquery>
	
<!--- Display the results --->	
	
	<table width="95%" border="0" align="center" cellpadding="2" cellspacing="0">
      
	  <!--- Display the question --->
      
	  <cfoutput query="Totals"> 
        <tr> 
          <td><div align="center"><strong>#Question#</strong></div></td>
        </tr>
      </cfoutput> 
      
	  <!--- Display the answers. and their number of votes. --->
      
	  <cfoutput query="Results"> 
        
		<!--- Set the percent of total votes for each answer. --->
        
		<cfset Percent=Round((Votes / Totals.TotalVotes) * 100)>
        <tr> 
          <td><div align="left">#Answer#</div></td>
        </tr>
        <tr> 
			
			<!--- Display the percentage of votes in a graph format. --->
			<!--- The width of the bar image is equal to the percentage. --->
          
		  <td><div align="left"><img align="middle" src="images/poll-graph.gif" width="#Percent#%" height="5"></div></td>
        </tr>
        <tr> 
          <td><div align="right"><em>#Votes# votes - #Percent#%</em></div></td>
        </tr>
      </cfoutput> 
		
		<!--- Display the total number of votes --->
      
	  <cfoutput query="Totals"> 
        <tr> 
          <td><div align="right"><strong>Total:</strong><em><strong> 
              </strong>#Int(TotalVotes)# votes</em></div></td>
        </tr>
      </cfoutput> 
    </table>
	
<div align="center">[<a href="?module=polls&action=results">Previous Poll Results</a>]</div>

<cfelse>

<!--- What to do if the cookie is not current --->
<!--- Show the form and send the form results to hip?module=polls&action=results and set the cookie on that page --->

  <cfquery datasource="#datasrc#" name="Current" MAXROWS = "1">
  SELECT questions.QuestionID
  FROM #table_poll_q# questions
  where SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
  ORDER BY questions.QuestionID DESC
  </cfquery>

  <cfset display = #Current.QuestionID#>
  
  <cfquery datasource="#datasrc#" name="Question">
  SELECT questions.QuestionID, questions.Question, answers.AnswerID, answers.Answer 
  FROM #table_poll_q# questions INNER JOIN #table_poll_a# answers 
  ON questions.QuestionID = answers.QuestionID 
  WHERE questions.QuestionID = #display# 
  AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
  ORDER BY answers.AnswerID 
  </cfquery>

<form action="?module=polls&action=results" method="post" name="Poll">
      <table border="0" align="center" cellpadding="4" cellspacing="0">
        <cfoutput query="Question" group="QuestionID"> 
          
		  <!--- Pass the question id as a hidden variable. --->
          
		  <input type="hidden" name="QuestionID" value="#QuestionID#">
          <tr> 
            <td colspan="2"><div align="center"><strong>#Question#</strong></div></td>
          </tr>
          
		  <!--- Display the answers. and their checkboxes --->
          
		  <cfoutput> 
          <tr> 
            <td width="10"><input type="radio" name="AnswerID" value="#AnswerID#"></td>
            <td><div align="left">#Answer#</div></td>
          </tr>
          </cfoutput>
		</cfoutput> 
        <tr> 
          <td colspan="2" align="center"><input name="Submit" type="submit" value="Vote"></td>
        </tr>
        <tr> 
          <td colspan="2" align="center"><div align="center">[<a href="?module=polls&action=results?QuestionID=<cfoutput>#display#</cfoutput>">View 
              Poll Results</a>]
			  <br>
            [<a href="?module=polls&action=results">Previous Poll Results</a>]</div></td>
        </tr>
      </table>
    </form>
    
</cfif>

<cfelse>

<!--- What to do if the cookie does not exist --->
<!--- Show the form and send the form results to hip?module=polls&action=results and set the cookie on that page ---> 

  <cfquery datasource="#datasrc#" name="Current" MAXROWS = "1">
  SELECT questions.QuestionID
  FROM #table_poll_q# questions
  where SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
  ORDER BY questions.QuestionID DESC
  </cfquery>

  <cfset display = #Current.QuestionID#>
  
  <cfquery datasource="#datasrc#" name="Question">
  SELECT questions.QuestionID, questions.Question, answers.AnswerID, answers.Answer 
  FROM #table_poll_q# questions INNER JOIN #table_poll_a# answers 
  ON questions.QuestionID = answers.QuestionID 
  WHERE questions.QuestionID = #display# 
  AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
  ORDER BY answers.AnswerID 
  </cfquery>
 
<form action="?module=polls&action=results" method="post" name="Poll">
      <table border="0" align="center" cellpadding="4" cellspacing="0">
        <cfoutput query="Question" group="QuestionID"> 
          
		  <!--- Pass the question id as a hidden variable. --->
          
		  <input type="hidden" name="QuestionID" value="#QuestionID#">
          <tr> 
            <td colspan="2"><div align="center"><strong>#Question#</strong></div></td>
          </tr>
          
		  <!--- Display the answers. and their checkboxes --->
          
		  <cfoutput> 
          <tr> 
            <td width="10"><input type="radio" name="AnswerID" value="#AnswerID#"></td>
            <td><div align="left">#Answer#</div></td>
          </tr>
          </cfoutput>
		</cfoutput> 
        <tr> 
          <td colspan="2" align="center"><input name="Submit" type="submit" value="Vote"></td>
        </tr>
        <tr> 
          <td colspan="2" align="center"><div align="center">[<a href="?module=polls&action=results?QuestionID=<cfoutput>#display#</cfoutput>">View Poll Results</a>]
          <br>
		  [<a href="?module=polls&action=results">Previous Poll Results</a>]</div></td>
        </tr>
      </table>
    </form>
	
</cfif><!--- Check for a cookie for the poll --->

<cfif IsDefined("cookie.fusionpoll")>

<!--- What to do if the cookie does exist --->
<!--- Check now to see if the cookie is current - does it have the correct ID? --->

	<cfquery datasource="#datasrc#" name="CurrentID" MAXROWS="1">
	SELECT questions.QuestionID
	FROM #table_poll_q# questions
    where SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
	ORDER BY QuestionID DESC
	</cfquery>

<cfif "#cookie.fusionpoll#" is "#CurrentID.QuestionID#">

<!--- What to do if the cookie is current --->
<!--- Query the question and the total number of votes for all the answers. --->

    <cfquery datasource="#datasrc#" name="Totals">
    SELECT questions.Question, SUM(answers.Votes) AS TotalVotes 
	FROM #table_poll_q# questions INNER JOIN #table_poll_a# answers 
	ON questions.QuestionID=answers.QuestionID 
	WHERE questions.QuestionID=#cookie.fusionpoll# 
    AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
    GROUP BY questions.Question 
    </cfquery>
	
<!--- Query the answers. and the number of votes for each one. --->

    <cfquery datasource="#datasrc#" name="Results">
    SELECT answers.Answer, answers.Votes 
	FROM #table_poll_a# answers 
	WHERE answers.QuestionID=#cookie.fusionpoll# 
    AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
	ORDER BY answers.AnswerID 
    </cfquery>
	
<!--- Display the results --->	
	
	<table width="95%" border="0" align="center" cellpadding="2" cellspacing="0">
      
	  <!--- Display the question --->
      
	  <cfoutput query="Totals"> 
        <tr> 
          <td><div align="center"><strong>#Question#</strong></div></td>
        </tr>
      </cfoutput> 
      
	  <!--- Display the answers. and their number of votes. --->
      
	  <cfoutput query="Results"> 
        
		<!--- Set the percent of total votes for each answer. --->
        
		<cfset Percent=Round((Votes / Totals.TotalVotes) * 100)>
        <tr> 
          <td><div align="left">#Answer#</div></td>
        </tr>
        <tr> 
			
			<!--- Display the percentage of votes in a graph format. --->
			<!--- The width of the bar image is equal to the percentage. --->
          
		  <td><div align="left"><img align="middle" src="images/poll-graph.gif" width="#Percent#%" height="5"></div></td>
        </tr>
        <tr> 
          <td><div align="right"><em>#Votes# votes - #Percent#%</em></div></td>
        </tr>
      </cfoutput> 
		
		<!--- Display the total number of votes --->
      
	  <cfoutput query="Totals"> 
        <tr> 
          <td><div align="right"><strong>Total:</strong><em><strong> 
              </strong>#Int(TotalVotes)# votes</em></div></td>
        </tr>
      </cfoutput> 
    </table>
	
<div align="center">[<a href="?module=polls&action=results">Previous Poll Results</a>]</div>

<cfelse>

<!--- What to do if the cookie is not current --->
<!--- Show the form and send the form results to hip?module=polls&action=results and set the cookie on that page --->

  <cfquery datasource="#datasrc#" name="Current" MAXROWS = "1">
  SELECT questions.QuestionID
  FROM #table_poll_q# questions
  where SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
  ORDER BY questions.QuestionID DESC
  </cfquery>

  <cfset display = #Current.QuestionID#>
  
  <cfquery datasource="#datasrc#" name="Question">
  SELECT questions.QuestionID, questions.Question, answers.AnswerID, answers.Answer 
  FROM #table_poll_q# questions INNER JOIN #table_poll_a# answers 
  ON questions.QuestionID = answers.QuestionID 
  WHERE questions.QuestionID = #display# 
  AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
  ORDER BY answers.AnswerID 
  </cfquery>

<form action="?module=polls&action=results" method="post" name="Poll">
      <table border="0" align="center" cellpadding="4" cellspacing="0">
        <cfoutput query="Question" group="QuestionID"> 
          
		  <!--- Pass the question id as a hidden variable. --->
          
		  <input type="hidden" name="QuestionID" value="#QuestionID#">
          <tr> 
            <td colspan="2"><div align="center"><strong>#Question#</strong></div></td>
          </tr>
          
		  <!--- Display the answers. and their checkboxes --->
          
		  <cfoutput> 
          <tr> 
            <td width="10"><input type="radio" name="AnswerID" value="#AnswerID#"></td>
            <td><div align="left">#Answer#</div></td>
          </tr>
          </cfoutput>
		</cfoutput> 
        <tr> 
          <td colspan="2" align="center"><input name="Submit" type="submit" value="Vote"></td>
        </tr>
        <tr> 
          <td colspan="2" align="center"><div align="center">[<a href="?module=polls&action=results?QuestionID=<cfoutput>#display#</cfoutput>">View 
              Poll Results</a>]
			  <br>
            [<a href="?module=polls&action=results">Previous Poll Results</a>]</div></td>
        </tr>
      </table>
    </form>
    
</cfif>

<cfelse>

<!--- What to do if the cookie does not exist --->
<!--- Show the form and send the form results to hip?module=polls&action=results and set the cookie on that page ---> 

  <cfquery datasource="#datasrc#" name="Current" MAXROWS = "1">
  SELECT questions.QuestionID
  FROM #table_poll_q# questions
  where SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
  ORDER BY questions.QuestionID DESC
  </cfquery>

  <cfset display = #Current.QuestionID#>
  
  <cfquery datasource="#datasrc#" name="Question">
  SELECT questions.QuestionID, questions.Question, answers.AnswerID, answers.Answer 
  FROM #table_poll_q# questions INNER JOIN #table_poll_a# answers 
  ON questions.QuestionID = answers.QuestionID 
  WHERE questions.QuestionID = #display# 
  AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
  ORDER BY answers.AnswerID 
  </cfquery>
 
<form action="?module=polls&action=results" method="post" name="Poll">
      <table border="0" align="center" cellpadding="4" cellspacing="0">
        <cfoutput query="Question" group="QuestionID"> 
          
		  <!--- Pass the question id as a hidden variable. --->
          
		  <input type="hidden" name="QuestionID" value="#QuestionID#">
          <tr> 
            <td colspan="2"><div align="center"><strong>#Question#</strong></div></td>
          </tr>
          
		  <!--- Display the answers. and their checkboxes --->
          
		  <cfoutput> 
          <tr> 
            <td width="10"><input type="radio" name="AnswerID" value="#AnswerID#"></td>
            <td><div align="left">#Answer#</div></td>
          </tr>
          </cfoutput>
		</cfoutput> 
        <tr> 
          <td colspan="2" align="center"><input name="Submit" type="submit" value="Vote"></td>
        </tr>
        <tr> 
          <td colspan="2" align="center"><div align="center">[<a href="?module=polls&action=results?QuestionID=<cfoutput>#display#</cfoutput>">View Poll Results</a>]
          <br>
		  [<a href="?module=polls&action=results">Previous Poll Results</a>]</div></td>
        </tr>
      </table>
    </form>
	
</cfif>
   </td>
  </tr>
</table>
