<cfcomponent>
<!---Sets the cookie for the polls--->
<CFAPPLICATION NAME="Cookies" SessionManagement="No" setDomainCookies="Yes">
<!---Gathers the IP and Converts it to the Country--->

<cffunction name="getpolls" access="public" hint="This Function Retrieves information to Load and display the poll" output="yes" returntype="any">
		<cfargument name="poll_color" type="string" required="yes">
        <cfargument name="poll_domain" type="string" required="yes">
        <cfargument name="vote_width" type="string" required="yes">
        <cfargument name="vote_results_img" type="string" required="yes">
        <cfargument name="datasrc" type="string" required="yes">
        <cfargument name="modules_dir" type="string" required="yes">
		<cfargument name="templates_dir" type="string" required="yes">
        <cfargument name="template" type="string" required="yes">
		
		<!---Begin the Queries to Get the Poll--->
        <cfquery name="Poll" datasource="#arguments.datasrc#">
<!---SELECT * FROM poll_questions WHERE question_domain='#request.application.webroot#'--->
SELECT TOP 1 #table_poll_q#.QuestionID, #table_poll_q#.Question
FROM #table_poll_q# INNER JOIN
#table_poll_a# ON #table_poll_q#.QuestionID = #table_poll_a#.QuestionID
ORDER BY NEWID()
</cfquery>
<cfset QuestionID = #Poll.QuestionID#>
<cfquery name="Poll_Question" datasource="#arguments.datasrc#">
SELECT * From #table_poll_a# WHERE QuestionID = #QuestionID# ORDER BY AnswerID ASC
</cfquery>
<!---End the Queries to Get the Poll--->

        <!---Now We Display the HTML, JavaScript, Styles and CF output--->
        <!---JavaScripts Go Here--->
<script type="text/javascript">

function imageholderclass(){
	this.over=new Array();
	this.down=new Array();
	this.src=new Array();
	this.store=store;
	
	function store(src, down, over){
		var AL=this.src.length;
		this.src[AL]=new Image(); this.src[AL].src=src;
		this.over[AL]=new Image(); this.over[AL].src=over;
		this.down[AL]=new Image(); this.down[AL].src=down;
	}
}

var ih = new imageholderclass();
var mouseisdown=0;

function preloader(t){
	for(i=0;i<t.length;i++){
		if(t[i].getAttribute('srcover')||t[i].getAttribute('srcdown')){
			
			storeimages(t[i]);
			var checker='';
			checker=(t[i].getAttribute('srcover'))?checker+'A':checker+'';
			checker=(t[i].getAttribute('srcdown'))?checker+'B':checker+'';
			
			switch(checker){
			case 'A' : mouseover(t[i]);mouseout(t[i]); break;
			case 'B' : mousedown(t[i]); mouseup2(t[i]); break;
			case 'AB' : mouseover(t[i]);mouseout(t[i]); mousedown(t[i]); mouseup(t[i]); break;
			default : return;			
			}
			
			if(t[i].src){t[i].setAttribute("oldsrc",t[i].src);}
		}
	}
}
function mouseup(t){
	var newmouseup;
	if(t.onmouseup){
		t.oldmouseup=t.onmouseup;
		newmouseup=function(){mouseisdown=0;this.src=this.getAttribute("srcover");this.oldmouseup();}

	}
	else{newmouseup=function(){mouseisdown=0;this.src=this.getAttribute("srcover");}}
	t.onmouseup=newmouseup;
}

function mouseup2(t){
	var newmouseup;
	if(t.onmouseup){
		t.oldmouseup=t.onmouseup;
		newmouseup=function(){mouseisdown=0;this.src=this.getAttribute("oldsrc");this.oldmouseup();}
		}
	else{newmouseup=function(){mouseisdown=0;this.src=this.getAttribute("oldsrc");}}
	t.onmouseup = newmouseup;
}

function mousedown(t){
	var newmousedown;
	if(t.onmousedown){
		t.oldmousedown=t.onmousedown;
		newmousedown=function(){if(mouseisdown==0){this.src=this.getAttribute("srcdown");this.oldmousedown();}}
	}
	else{newmousedown=function(){if(mouseisdown==0){this.src=this.getAttribute("srcdown");}}}
	t.onmousedown=newmousedown;
}

function mouseover(t){
	var newmouseover;
	if(t.onmouseover){
		t.oldmouseover=t.onmouseover;
		newmouseover=function(){this.src=this.getAttribute("srcover");this.oldmouseover();}
	}
	else{newmouseover=function(){this.src=this.getAttribute("srcover");}}
	t.onmouseover=newmouseover;
}

function mouseout(t){
	var newmouseout;
	if(t.onmouseout){
		t.oldmouseout=t.onmouseout;
		newmouseout=function(){this.src=this.getAttribute("oldsrc");this.oldmouseout();}
	}
	else{newmouseout=function(){this.src=this.getAttribute("oldsrc");}}
	t.onmouseout=newmouseout;
}

function storeimages(t){
	var s=(t.getAttribute('src'))?t.getAttribute('src'):'';
	var d=(t.getAttribute('srcdown'))?t.getAttribute('srcdown'):'';
	var o=(t.getAttribute('srcover'))?t.getAttribute('srcover'):'';
	ih.store(s,d,o);
}

function preloadimgsrc(){
	if(!document.getElementById) return;
	var it=document.getElementsByTagName('IMG');
	var it2=document.getElementsByTagName('INPUT');
	preloader(it);
	preloader(it2);
}

if(window.addEventListener){window.addEventListener("load", preloadimgsrc, false);} 
else{
	if(window.attachEvent){window.attachEvent("onload", preloadimgsrc);}
	else{if(document.getElementById){window.onload=preloadimgsrc;}}
}
</script>
<script type="text/javascript">
function opacity(id, opacStart, opacEnd, millisec) {
	//speed for each frame
	var speed = Math.round(millisec / 100);
	var timer = 0;

	//determine the direction for the blending, if start and end are the same nothing happens
	if(opacStart > opacEnd) {
		for(i = opacStart; i >= opacEnd; i--) {
			setTimeout("changeOpac(" + i + ",'" + id + "')",(timer * speed));
			timer++;
		}
	} else if(opacStart < opacEnd) {
		for(i = opacStart; i <= opacEnd; i++)
			{
			setTimeout("changeOpac(" + i + ",'" + id + "')",(timer * speed));
			timer++;
		}
	}
}

//change the opacity for different browsers
function changeOpac(opacity, id) {
	var object = document.getElementById(id).style; 
	object.opacity = (opacity / 100);
	object.MozOpacity = (opacity / 100);
	object.KhtmlOpacity = (opacity / 100);
	object.filter = "alpha(opacity=" + opacity + ")";
}

function shiftOpacity(id, millisec) {
	//if an element is invisible, make it visible, else make it ivisible
	if(document.getElementById(id).style.opacity == 0) {
		opacity(id, 0, 100, millisec);
	} else {
		opacity(id, 100, 0, millisec);
	}
}

function blendimage(divid, imageid, imagefile, millisec) {
	var speed = Math.round(millisec / 100);
	var timer = 0;
	
	//set the current image as background
	document.getElementById(divid).style.backgroundImage = "url(" + document.getElementById(imageid).src + ")";
	
	//make image transparent
	changeOpac(0, imageid);
	
	//make new image
	document.getElementById(imageid).src = imagefile;

	//fade in image
	for(i = 0; i <= 100; i++) {
		setTimeout("changeOpac(" + i + ",'" + imageid + "')",(timer * speed));
		timer++;
	}
}

function currentOpac(id, opacEnd, millisec) {
	//standard opacity is 100
	var currentOpac = 100;
	
	//if the element has an opacity set, get it
	if(document.getElementById(id).style.opacity < 100) {
		currentOpac = document.getElementById(id).style.opacity * 100;
	}

	//call for the function that changes the opacity
	opacity(id, currentOpac, opacEnd, millisec)
}
</script>
<script type="text/javascript">

crir = {
	init: function() {
		arrLabels = document.getElementsByTagName('label');
	
		searchLabels:
		for (var i=0; i<arrLabels.length; i++) {			
			// get the input element based on the for attribute of the label tag
			if (arrLabels[i].getAttributeNode('for') && arrLabels[i].getAttributeNode('for').value != '') {
				labelElementFor = arrLabels[i].getAttributeNode('for').value;				
				inputElement = document.getElementById(labelElementFor);
			}
			else {				
				continue searchLabels;
			}	
							
			inputElementClass = inputElement.className;	
		
			// if the input is specified to be hidden intiate it
			if (inputElementClass == 'crirHiddenJS') {
				inputElement.className = 'crirHidden';
				
				inputElementType = inputElement.getAttributeNode('type').value;	
				
				// add the appropriate event listener to the input element
				if (inputElementType == "checkbox") {
					inputElement.onclick = crir.toggleCheckboxLabel;
				}
				else {
					inputElement.onclick = crir.toggleRadioLabel;
				}
				
				// set the initial label state
				if (inputElement.checked) {
					if (inputElementType == 'checkbox') { arrLabels[i].className = 'checkbox_checked'}
					else { arrLabels[i].className = 'radio_checked' }
				}
				else {
					if (inputElementType == 'checkbox') { arrLabels[i].className = 'checkbox_unchecked'}
					else { arrLabels[i].className = 'radio_unchecked' }
				}
			}
			else if (inputElement.nodeName != 'SELECT' && inputElement.getAttributeNode('type').value == 'radio') { // this so even if a radio is not hidden but belongs to a group of hidden radios it will still work.
				arrLabels[i].onclick = crir.toggleRadioLabel;
				inputElement.onclick = crir.toggleRadioLabel;
			}
		}			
	},	
	
	findLabel: function (inputElementID) {
		arrLabels = document.getElementsByTagName('label');
	
		searchLoop:
		for (var i=0; i<arrLabels.length; i++) {
			if (arrLabels[i].getAttributeNode('for') && arrLabels[i].getAttributeNode('for').value == inputElementID) {				
				return arrLabels[i];
				break searchLoop;				
			}
		}		
	},	
	
	toggleCheckboxLabel: function () {
		labelElement = crir.findLabel(this.getAttributeNode('id').value);
	
		if(labelElement.className == 'checkbox_checked') {
			labelElement.className = "checkbox_unchecked";
		}
		else {
			labelElement.className = "checkbox_checked";
		}
	},	
	
	toggleRadioLabel: function () {			 
		clickedLabelElement = crir.findLabel(this.getAttributeNode('id').value);
		
		clickedInputElement = this;
		clickedInputElementName = clickedInputElement.getAttributeNode('name').value;
		
		arrInputs = document.getElementsByTagName('input');
	
		// uncheck (label class) all radios in the same group
		for (var i=0; i<arrInputs.length; i++) {			
			inputElementType = arrInputs[i].getAttributeNode('type').value;
			if (inputElementType == 'radio') {
				inputElementName = arrInputs[i].getAttributeNode('name').value;
				inputElementClass = arrInputs[i].className;
				// find radio buttons with the same 'name' as the one we've changed and have a class of chkHidden
				// and then set them to unchecked
				if (inputElementName == clickedInputElementName && inputElementClass == 'crirHidden') {				
					inputElementID = arrInputs[i].getAttributeNode('id').value;
					labelElement = crir.findLabel(inputElementID);
					labelElement.className = 'radio_unchecked';
				}
			}
		}
	
		// if the radio clicked is hidden set the label to checked
		if (clickedInputElement.className == 'crirHidden') {
			clickedLabelElement.className = 'radio_checked';
		}
	},
	
	addEvent: function(element, eventType, doFunction, useCapture){
		if (element.addEventListener) 
		{
			element.addEventListener(eventType, doFunction, useCapture);
			return true;
		} else if (element.attachEvent) {
			var r = element.attachEvent('on' + eventType, doFunction);
			return r;
		} else {
			element['on' + eventType] = doFunction;
		}
	}
}

crir.addEvent(window, 'load', crir.init, false);
</script>
<noscript><style type="text/css">.fader {
filter: alpha(opacity=100);
-moz-opacity: 100;
opacity: 100;
}
</style></noscript>
<!---End JavaScripts--->
<!---Inline Styles--->
<style>
.fader { /* avoids flickering at the beginning */
filter: alpha(opacity=0);
-moz-opacity: 0;
opacity: 0;
font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:12px;
} 
.results_shown{
font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:12px;
}
.results_small{
font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:10px;
font-weight:bold;

}
.results_small1 {font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:10px;
font-weight:bold;

}
/* Radio Buttons */
label.radio_checked {
	background: url(http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/radio1.gif) no-repeat;	
	display: block;
	height: 16px;
	/*margin: 25px 0;*/
	padding-left: 20px;
}
label.radio_unchecked  {
	background: url(http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/radio0.gif) no-repeat;	
	display: block;
	height: 16px;
	/*margin: 25px 0;*/
	padding-left: 20px;
}
/* Hover State */
label:hover{
	color: ##575B60;
}

label.highlighted {
	border: 1px solid ##333;
}

/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */
/* STOP EDITTING - DO NOT CHANGE OR REMOVE        */
/* The Following Class Moves the 'standard' form elements (Radio Buttons, Check Boxes, etc.),
Into a hidden state and replaces the inputs with graphical based form elements*/
.crirHidden {
	position: absolute;
	left: -1000px;
}
/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */

</style>

<!---End Inline Styles--->
<!--- Check if cookie is defined:
Yes: User have already voted, send user to show results.
No: User has not voted, let user vote. --->
<!--- User has voted, so send user to show vote results. --->
<body onLoad="opacity('votes', 0, 100, 1000)">
<cfif IsDefined("cookie.fusionpoll")>
<form action="<cfoutput>http://#arguments.site_domain##arguments.site_folder#index.cfm?module=polls&action=dsp_results&QID=#poll.QuestionID#</cfoutput>" NAME="Add_Update" METHOD="post">
<input name="_" type="hidden" value="_">
<script language="JavaScript">
<!--
document.Add_Update.submit();
//--
</script>
</form>
<!--- End of the </form> that automatically send the visitor to show vote results. --->
</cfif>
<!--- </cfif> End of visitor have voted. --->
<!--- Start making tables for vote. --->

<!--- Find numbers of poll questions. --->
<cfset TotalRows = Poll_Question.RecordCount>
<!--- Write out our poll. --->

<form action="<cfoutput>http://#arguments.site_domain##arguments.site_folder#</cfoutput>index.cfm?module=polls&action=act_results" method="post" name="Vote_Action">
<table width="<cfoutput>#arguments.vote_width#</cfoutput>" border="0" align="center" cellpadding="0" cellspacing="0" id="votes">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="13%"><img name="n_polls_phase_2_sm_r1_c1" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r1_c1.jpg" width="22" height="20" border="0" id="n_polls_phase_2_sm_r1_c2" alt="" /></td>
        <td width="75%" background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r1_c3.jpg"><img name="n_polls_phase_2_sm_r1_c3" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r1_c3.jpg" width="132" height="20" border="0" id="n_polls_phase_2_sm_r1_c6" alt="" /></td>
        <td width="12%"><img name="n_polls_phase_2_sm_r1_c4" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r1_c4.jpg" width="21" height="20" border="0" id="n_polls_phase_2_sm_r1_c5" alt="" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
   <td background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r2_c1.jpg"><img name="n_polls_phase_2_sm_r2_c1" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/spacer.gif" width="6" height="10" border="0" id="n_polls_phase_2_sm_r2_c1" alt="" /></td>
   <td width="163" background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r2_c2.jpg"><span class="results_small"><b><cfoutput>#poll.Question# <!---(QID:  #poll.QuestionID#)---></cfoutput></b></span><br>
    <div id="votes">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="results_small">
<br>
<!--- Start a query loop that write out the radio button and question. --->
<cfloop query="Poll_Question" startrow="1" endrow="#TotalRows#">
<tr>
<td><!---<input name="AnswerID" type="radio" id="AnswerID" value="<cfoutput>#AnswerID#</cfoutput>">--->
<label for="AnswerID<cfoutput>#AnswerID#</cfoutput>"><cfoutput>#Answer#</cfoutput></label>
			<input name="AnswerID" id="AnswerID<cfoutput>#AnswerID#</cfoutput>" type="radio" value="<cfoutput>#AnswerID#</cfoutput>" class="crirHiddenJS" /><br></td>
</tr>
</cfloop>
<!--- End of the </cfloop> for poll radio buttons and questions. --->
</table></div>
<CENTER>
<input type="hidden" name="QuestionID" Value="<cfoutput>#poll.QuestionID#</cfoutput>">
<!---OriginalButton<input name="vote_answer" type= "button"onClick="changeFormAction('polls.cfm?action=act_results')" value="Vote">--->
<input name="vote_answer" type="image" value="Vote" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/vote_button.gif" srcover="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/vote_button_over.gif" border="0"> <!---OriginalView REsults Button<input name="Submit2" type= "button"onClick="changeFormAction('polls.cfm?action=dsp_results&QID=<cfoutput>#poll.QuestionID#</cfoutput>')" value="View results">--->
<img src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/results_button.gif" srcover="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/results_button_over.gif" border="0" onClick="window.location='index.cfm?module=polls&action=dsp_results&QID=<cfoutput>#poll.QuestionID#</cfoutput>'">  </CENTER></td>
   <td background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r2_c5.jpg"><img name="n_polls_phase_2_sm_r2_c5" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/spacer.gif" width="6" height="10" border="0" id="n_polls_phase_2_sm_r2_c5" alt="" /></td>
  
  </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="13%"><img name="n_polls_phase_2_sm_r3_c1" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r3_c1.jpg" width="22" height="21" border="0" id="n_polls_phase_2_sm_r3_c6" alt="" /></td>
        <td width="75%" background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r3_c3.jpg"><img name="n_polls_phase_2_sm_r3_c3" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r3_c3.jpg" width="132" height="21" border="0" id="n_polls_phase_2_sm_r3_c5" alt="" /></td>
        <td width="12%"><img name="n_polls_phase_2_sm_r3_c4" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r3_c4.jpg" width="21" height="21" border="0" id="n_polls_phase_2_sm_r3_c2" alt="" /></td>
      </tr>
    </table></td>
  </tr>
</table>

        <!---End of HTML, Javascript, Styles and CF output--->
	</cffunction>
    
<cffunction name="dspresults" access="public" hint="This Function Displays the Results of the Poll" output="yes" returntype="any">
    <!---Queries Before we Load the Modules--->
<cfquery name="Find_Poll_Name" datasource="#arguments.datasrc#">
Select * FROM #table_poll_q# WHERE QuestionID = #URL.QID#
</cfquery>
<cfquery name="Number_of_questions" datasource="#arguments.datasrc#">
SELECT * FROM #table_poll_a# WHERE QuestionID = #URL.QID#
</cfquery>
<!---Stats: IP and Country Gathering--->

<!---End Stats--->
<cfif #arguments.results_display# EQ "chart">
<!---Inline Styles--->
<style>
.fader { /* avoids flickering at the beginning */
filter: alpha(opacity=0);
-moz-opacity: 0;
opacity: 0;
font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:12px;
} 
.results_shown{
font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:12px;
}
.results_small{
font-family:Verdana, Arial, Helvetica, sans-serif;
color: ##000000;
font-size:10px;
font-weight:bold;

}


/* Radio Buttons */
label.radio_checked {
	background: url(http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/radio1.gif) no-repeat;	
	display: block;
	height: 16px;
	/*margin: 25px 0;*/
	padding-left: 20px;
}
label.radio_unchecked  {
	background: url(http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/radio0.gif) no-repeat;	
	display: block;
	height: 16px;
	/*margin: 25px 0;*/
	padding-left: 20px;
}
/* Hover State */
label:hover{
	color: ##575B60;
}

label.highlighted {
	border: 1px solid ##333;
}

/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */
/* STOP EDITTING - DO NOT CHANGE OR REMOVE        */
.crirHidden {
	position: absolute;
	left: -1000px;
}
/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */

</style>

<!---End Inline Styles--->
<!--- Remember the number of poll questions. --->
<cfset TotalRows = Number_of_questions.RecordCount>
<!--- Set the total vote answers like zero. --->
<cfset Tot_answers = 0>
<!--- Loop that counts the number of vote answers. --->
<cfloop query="Number_of_questions" startrow="1" endrow="#TotalRows#">
<!--- Find new total vote answers. --->
</cfloop>
<!--- End of the </cfloop> that counts number of vote answers. --->

        
        <b class="results_small">Current Results for the Poll:<br><cfoutput>#Find_Poll_Name.Question#</cfoutput></b>
        <br>
        <br>
       
<!--- Find the percent of the poll question answer. --->
<cfchart format="flash" scalefrom="1" scaleto="100" showxgridlines="no"
             showygridlines="no" showborder="no" fontbold="no" fontitalic="no"
             xaxistitle="Answers" yaxistitle="Votes" show3d="no" rotated="no"
             sortxaxis="no" showlegend="no" showmarkers="yes" title = "Current Results for: #Find_Poll_Name.Question#">
                     <cfchartseries type="bar" serieslabel="Results for: #Find_Poll_Name.Question#" seriescolor="#arguments.poll_color#" dataLabelStyle="value">
                     <cfloop query="Number_of_questions" startrow="1" endrow="#TotalRows#">
                     <cfchartdata item="#Number_of_questions.Answer#" value="#Votes#">
                     </cfloop>
                      </cfchartseries>
                      <!---<cfchartseries type="line" serieslabel="Results for: #Find_Poll_Name.Question#" seriescolor="#arguments.poll_color#" dataLabelStyle="value">
                     <cfloop query="Number_of_questions" startrow="1" endrow="#TotalRows#">
                     <cfset Tot_answers = Tot_answers + #Votes#>
<cfset Percent=Round((Votes / Tot_answers) * 100)>
<cfchartdata item="#Number_of_questions.Answer#" value="#Percent#">
</cfloop>
</cfchartseries>--->
                   
</cfchart>


<cfelseif #arguments.results_display# EQ "HTML">
<!---JavaScripts Go Here--->

<script type="text/javascript">

function imageholderclass(){
	this.over=new Array();
	this.down=new Array();
	this.src=new Array();
	this.store=store;
	
	function store(src, down, over){
		var AL=this.src.length;
		this.src[AL]=new Image(); this.src[AL].src=src;
		this.over[AL]=new Image(); this.over[AL].src=over;
		this.down[AL]=new Image(); this.down[AL].src=down;
	}
}

var ih = new imageholderclass();
var mouseisdown=0;

function preloader(t){
	for(i=0;i<t.length;i++){
		if(t[i].getAttribute('srcover')||t[i].getAttribute('srcdown')){
			
			storeimages(t[i]);
			var checker='';
			checker=(t[i].getAttribute('srcover'))?checker+'A':checker+'';
			checker=(t[i].getAttribute('srcdown'))?checker+'B':checker+'';
			
			switch(checker){
			case 'A' : mouseover(t[i]);mouseout(t[i]); break;
			case 'B' : mousedown(t[i]); mouseup2(t[i]); break;
			case 'AB' : mouseover(t[i]);mouseout(t[i]); mousedown(t[i]); mouseup(t[i]); break;
			default : return;			
			}
			
			if(t[i].src){t[i].setAttribute("oldsrc",t[i].src);}
		}
	}
}
function mouseup(t){
	var newmouseup;
	if(t.onmouseup){
		t.oldmouseup=t.onmouseup;
		newmouseup=function(){mouseisdown=0;this.src=this.getAttribute("srcover");this.oldmouseup();}

	}
	else{newmouseup=function(){mouseisdown=0;this.src=this.getAttribute("srcover");}}
	t.onmouseup=newmouseup;
}

function mouseup2(t){
	var newmouseup;
	if(t.onmouseup){
		t.oldmouseup=t.onmouseup;
		newmouseup=function(){mouseisdown=0;this.src=this.getAttribute("oldsrc");this.oldmouseup();}
		}
	else{newmouseup=function(){mouseisdown=0;this.src=this.getAttribute("oldsrc");}}
	t.onmouseup = newmouseup;
}

function mousedown(t){
	var newmousedown;
	if(t.onmousedown){
		t.oldmousedown=t.onmousedown;
		newmousedown=function(){if(mouseisdown==0){this.src=this.getAttribute("srcdown");this.oldmousedown();}}
	}
	else{newmousedown=function(){if(mouseisdown==0){this.src=this.getAttribute("srcdown");}}}
	t.onmousedown=newmousedown;
}

function mouseover(t){
	var newmouseover;
	if(t.onmouseover){
		t.oldmouseover=t.onmouseover;
		newmouseover=function(){this.src=this.getAttribute("srcover");this.oldmouseover();}
	}
	else{newmouseover=function(){this.src=this.getAttribute("srcover");}}
	t.onmouseover=newmouseover;
}

function mouseout(t){
	var newmouseout;
	if(t.onmouseout){
		t.oldmouseout=t.onmouseout;
		newmouseout=function(){this.src=this.getAttribute("oldsrc");this.oldmouseout();}
	}
	else{newmouseout=function(){this.src=this.getAttribute("oldsrc");}}
	t.onmouseout=newmouseout;
}

function storeimages(t){
	var s=(t.getAttribute('src'))?t.getAttribute('src'):'';
	var d=(t.getAttribute('srcdown'))?t.getAttribute('srcdown'):'';
	var o=(t.getAttribute('srcover'))?t.getAttribute('srcover'):'';
	ih.store(s,d,o);
}

function preloadimgsrc(){
	if(!document.getElementById) return;
	var it=document.getElementsByTagName('IMG');
	var it2=document.getElementsByTagName('INPUT');
	preloader(it);
	preloader(it2);
}

if(window.addEventListener){window.addEventListener("load", preloadimgsrc, false);} 
else{
	if(window.attachEvent){window.attachEvent("onload", preloadimgsrc);}
	else{if(document.getElementById){window.onload=preloadimgsrc;}}
}
</script>

<script type="text/javascript">
function opacity(id, opacStart, opacEnd, millisec) {
	//speed for each frame
	var speed = Math.round(millisec / 100);
	var timer = 0;

	//determine the direction for the blending, if start and end are the same nothing happens
	if(opacStart > opacEnd) {
		for(i = opacStart; i >= opacEnd; i--) {
			setTimeout("changeOpac(" + i + ",'" + id + "')",(timer * speed));
			timer++;
		}
	} else if(opacStart < opacEnd) {
		for(i = opacStart; i <= opacEnd; i++)
			{
			setTimeout("changeOpac(" + i + ",'" + id + "')",(timer * speed));
			timer++;
		}
	}
}

//change the opacity for different browsers
function changeOpac(opacity, id) {
	var object = document.getElementById(id).style; 
	object.opacity = (opacity / 100);
	object.MozOpacity = (opacity / 100);
	object.KhtmlOpacity = (opacity / 100);
	object.filter = "alpha(opacity=" + opacity + ")";
}

function shiftOpacity(id, millisec) {
	//if an element is invisible, make it visible, else make it ivisible
	if(document.getElementById(id).style.opacity == 0) {
		opacity(id, 0, 100, millisec);
	} else {
		opacity(id, 100, 0, millisec);
	}
}

function blendimage(divid, imageid, imagefile, millisec) {
	var speed = Math.round(millisec / 100);
	var timer = 0;
	
	//set the current image as background
	document.getElementById(divid).style.backgroundImage = "url(" + document.getElementById(imageid).src + ")";
	
	//make image transparent
	changeOpac(0, imageid);
	
	//make new image
	document.getElementById(imageid).src = imagefile;

	//fade in image
	for(i = 0; i <= 100; i++) {
		setTimeout("changeOpac(" + i + ",'" + imageid + "')",(timer * speed));
		timer++;
	}
}

function currentOpac(id, opacEnd, millisec) {
	//standard opacity is 100
	var currentOpac = 100;
	
	//if the element has an opacity set, get it
	if(document.getElementById(id).style.opacity < 100) {
		currentOpac = document.getElementById(id).style.opacity * 100;
	}

	//call for the function that changes the opacity
	opacity(id, currentOpac, opacEnd, millisec)
}
</script>
<noscript><style type="text/css">
.fader {
filter: alpha(opacity=100);
-moz-opacity: 100;
opacity: 100;
}
</style></noscript>
<script src="_funcs/SpryAssets/SpryEffects.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
function MM_effectGrowShrink(targetElement, duration, from, to, toggle, referHeight, growFromCenter)
{
	Spry.Effect.DoGrow(targetElement, {duration: duration, from: from, to: to, toggle: toggle, referHeight: referHeight, growCenter: growFromCenter});
}
//-->
</script>
<!---End JavaScripts--->
<!---Inline Styles--->
<style>
.fader { /* avoids flickering at the beginning */
filter: alpha(opacity=0);
-moz-opacity: 0;
opacity: 0;
font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:12px;
} 
.results_shown{
font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:12px;
}
.results_small{
font-family:Verdana, Arial, Helvetica, sans-serif;
color: ##000000;
font-size:10px;
font-weight:bold;

}
.results_small1 {font-family:Verdana, Arial, Helvetica, sans-serif;
<cfif #arguments.poll_color# EQ "blue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "lblue">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "purple">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "green">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "red">
color: ##ffffff;
<cfelseif #arguments.poll_color# EQ "grey">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "yellow">
color: ##000000;
<cfelseif #arguments.poll_color# EQ "gold">
color: ##000000;
</cfif>
font-size:10px;
font-weight:bold;

}

/* Radio Buttons */
label.radio_checked {
	background: url(http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/radio1.gif) no-repeat;	
	display: block;
	height: 16px;
	/*margin: 25px 0;*/
	padding-left: 20px;
}
label.radio_unchecked  {
	background: url(http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/radio0.gif) no-repeat;	
	display: block;
	height: 16px;
	/*margin: 25px 0;*/
	padding-left: 20px;
}
/* Hover State */
label:hover{
	color: ##575B60;
}

label.highlighted {
	border: 1px solid ##333;
}

/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */
/* STOP EDITTING - DO NOT CHANGE OR REMOVE        */
.crirHidden {
	position: absolute;
	left: -1000px;
}
/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */

</style>

<!---End Inline Styles--->
<!--- Remember the number of poll questions. --->
<cfset TotalRows = Number_of_questions.RecordCount>
<!--- Set the total vote answers like zero. --->
<cfset Tot_answers = 0>
<!--- Loop that counts the number of vote answers. --->
<cfloop query="Number_of_questions" startrow="1" endrow="#TotalRows#">
<!--- Find new total vote answers. --->
<cfset Tot_answers = Tot_answers + #Votes#>
</cfloop>
<!--- End of the </cfloop> that counts number of vote answers. --->


<body onLoad="opacity('results', 0, 100, 500);">


<table width="<cfoutput>#arguments.vote_width#</cfoutput>" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="7%"><img name="n_polls_phase_2_sm_r1_c1" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r1_c1.jpg" width="22" height="20" border="0" id="n_polls_phase_2_sm_r1_c2" alt="" /></td>
        <td width="86%" background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r1_c3.jpg"><img name="n_polls_phase_2_sm_r1_c3" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r1_c3.jpg" width="132" height="20" border="0" id="n_polls_phase_2_sm_r1_c6" alt="" /></td>
        <td width="7%"><img name="n_polls_phase_2_sm_r1_c4" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r1_c4.jpg" width="21" height="20" border="0" id="n_polls_phase_2_sm_r1_c5" alt="" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="<cfoutput>#arguments.vote_width#</cfoutput>" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r2_c1.jpg"><img name="n_polls_phase_2_sm_r2_c1" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/spacer.gif" width="6" height="10" border="0" id="n_polls_phase_2_sm_r2_c1" alt="" /></td>
        <td width="100%" background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r2_c2.jpg" ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        
        <td align="center" valign="top" class="results_small1">
        
        <b ><cfoutput>#Find_Poll_Name.Question#</cfoutput></b>
        <br>
        <br>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="results_shown">
      
<!--- Loop through all the poll questions. --->
<cfloop query="Number_of_questions" startrow="1" endrow="#TotalRows#">
<!--- Find the percent of the poll question answer. --->
<cfif Tot_answers eq "0">
There are No answers for this poll.<br>
Be the First to Vote!<br>
<a href="polls.cfm?QID=<cfoutput>#url.QID#</cfoutput>"><IMG src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/vote_button.gif" srcover="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/vote_button_over.gif" border="0"></a>
<cfset Percent="0">
<cfelse>
<cfset Percent=Round((Votes / Tot_answers) * 100)>
</cfif>  

<tr>
  <td><!--- Output the poll question. --->
  <i class="results_small1"><b><cfoutput>#Answer#</cfoutput></b></i></td>
</tr>
<tr>
<td>
<!--- Output the poll answer graphical bar. --->
<img align="middle" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/poll-graph_left1.jpg" height="15" onload="MM_effectGrowShrink(this, 3000, '0%', '100%', false, false, false)"><img src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.vote_results_img#</cfoutput>" width="<cfoutput>#Percent#</cfoutput>%" height="15" align="middle" onload="MM_effectGrowShrink(this, 3000, '0%', '100%', false, false, false)"><img align="middle" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/poll-graph_right1.jpg" height="15" onload="MM_effectGrowShrink(this, 3000, '0%', '100%', false, false, false)"><br>

 </td>
</tr>
<tr>
<td align="right"><!--- Output: number of votes and the vote percents. --->
<span class="results_small1">&nbsp;&nbsp;&nbsp;<cfoutput>#Votes#</cfoutput>&nbsp;votes&nbsp;<cfoutput>(#Percent#%)</cfoutput></span>

</td>
</tr>
</cfloop>

<!--- End of the </cfloop> through all poll questions. --->

</table></td>
        
      </tr>
    </table></td>
        <td background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r2_c5.jpg" width="13"><img name="n_polls_phase_2_sm_r2_c1" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/spacer.gif" width="6" height="10" border="0" id="n_polls_phase_2_sm_r2_c1" alt="" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="7%"><img name="n_polls_phase_2_sm_r3_c1" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r3_c1.jpg" width="22" height="21" border="0" id="n_polls_phase_2_sm_r3_c6" alt="" /></td>
        <td width="86%" background="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r3_c3.jpg"><img name="n_polls_phase_2_sm_r3_c3" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r3_c3.jpg" width="132" height="21" border="0" id="n_polls_phase_2_sm_r3_c5" alt="" /></td>
        <td width="7%"><img name="n_polls_phase_2_sm_r3_c4" src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/polls_<cfoutput>#arguments.poll_color#</cfoutput>_r3_c4.jpg" width="21" height="21" border="0" id="n_polls_phase_2_sm_r3_c2" alt="" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</cfif>

<cfif NOT isDefined("cookie.fusionpoll")>
<center>
<a href="index.cfm"><img src="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/vote_button.gif" srcover="http://<cfoutput>#arguments.site_domain##arguments.site_folder##arguments.templates_dir##arguments.template#/#arguments.modules_dir#</cfoutput>polls/images/<cfoutput>#arguments.poll_color#</cfoutput>/vote_button_over.gif" border="0"></a>
</center>
</cfif>

<!---End of HTML, Javascript, Styles and CF output--->
    </cffunction>
    
<cffunction name="actresults" access="public" hint="This Function Counts the Vote & Displays the Results of the Poll" output="yes" returntype="any">
<cfif NOT isDefined("Form.AnswerID")>
<cflocation url="index.cfm?module=polls">
</cfif>   
    <!--- cftransaction:Groups multiple queries into a single unit.
The cftransaction tag provides commit and rollback processing. --->
<cftransaction>

<!--- Find the question visitor has voted. --->
<cfquery name="Last_vote" datasource="#arguments.datasrc#">
SELECT * FROM #table_poll_a# WHERE AnswerID = #Form.AnswerID#
</cfquery>
<!--- Add visitors vote to the number of votes for this question. --->
<cfset New_Votes=Last_vote.Votes + 1>
<!--- Update our database with the new number. --->
<cfquery name="Update_Vote" datasource="#arguments.datasrc#">
UPDATE #table_poll_a# SET Votes=#New_Votes# WHERE AnswerID=#AnswerID#
</cfquery>

</cftransaction>
<!--- Set the cookie. --->
<!--- Comment out 'set cookie' when you are testing. --->
<cfcookie name="fusionpoll" value="#Form.QuestionID#" expires="1">
<!---Beginning of HTML, Javascript, Styles and CF output--->
<!---Load the Module--->
<!---<cfinclude template="funcs/new_results.cfm">--->
<!---End of  Module--->
<!--- The cookie is defined. Visitor has voted, so send visitor to show vote results. --->
<cfif IsDefined("cookie.fusionpoll")>
<cfset QID = #Form.QuestionID#>
<form action="index.cfm?module=polls&action=dsp_results&QID=<cfoutput>QID</cfoutput>" NAME="Add_Update" METHOD="post">
<input name="_" type="hidden" value="_">
<script language="JavaScript">
<!--
document.Add_Update.submit();
//--
</script>
</form>
<!--- End of the form that send visitor automatically to show results, if visitor have voted. --->
</cfif>
<!--- End </cfif> for visitor that has voted. --->
<cfif IsDefined("Form.AnswerID")>

<cfset QID = #Form.QuestionID#>

<!--- Ok, user has voted. Send user automatically to show vote results. --->
<cflocation url="index.cfm?module=polls&action=dsp_results&QID=#QID#">
<cfelse>
<!--- If user has not selected a radio button, send user back to vote. --->
<cflocation url = "index.cfm?module=polls&msg=error">
</cfif>
<!---End of HTML, Javascript, Styles and CF output--->s
</cffunction>

<cffunction name="pollstats" access="public" hint="This Function Displays the Poll Stats: PollId, IP Address, User Agent" output="yes" returntype="query">
<cfquery name="pollstats" datasource="#arguments.datasrc#">
select * from poll_stats
</cfquery> 
<cfreturn pollstats>
</cffunction>
<cffunction name="pollcharts" access="public" hint="This Function Displays the Poll Results Stats" output="yes" returntype="query">
<cfquery name="pollcharts" datasource="#arguments.datasrc#">
select * from #table_poll_a# where questionid = '#url.QID#'
</cfquery> 

<cfreturn pollcharts>
</cffunction>
</cfcomponent>