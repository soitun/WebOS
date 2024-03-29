<cflock timeout="100" throwontimeout="No" name="UpdateDB" >

<cfif Action IS "reply">
		<CFQUERY name="getmax" datasource="#datasrc#">
			SELECT Max(Thread) As MaxThread FROM #table_forum_entries# WHERE PostNum = #PostNum#
            AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
		</cfquery>	
		
		<cfquery name="getThreads" datasource="#datasrc#">
			SELECT Distinct Email FROM #table_forum_entries# WHERE PostNUm = #PostNum#
            AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
		</cfquery>
		
		<cfquery name="clearEnd" datasource="#datasrc#">
			UPDATE #table_forum_entries# SET ThreadEnd = 0 WHERE PostNum = #PostNum#	
            AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
		</cfquery>

		<cfquery name="update" datasource="#datasrc#">		
			INSERT INTO #table_forum_entries#
			(RoomID,Title,Author,Email,Message,PostNum,Thread, CreateDate,ThreadEnd, ThreadCount, SiteID)
			VALUES
			(#RoomID#, '#Title#', '#Author#', '#Email#','#Message#', #PostNum#, #Evaluate(getMax.MaxThread+1)#,#CreateODBCDateTime(Now())#, 1, 0, <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">)
		</cfquery>
		
		<CFQUERY name="getNew" datasource="#datasrc#">
			SELECT Max(EntryID) As MaxEntryID FROM #table_forum_entries#
            where SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
		</cfquery>	
		
		<cfquery name="count" datasource="#datasrc#">
			SELECT Count(EntryID) As MsgCount FROM #table_forum_entries# WHERE PostNUm = #PostNUm# 
            AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
		</cfquery>
		
		<cfquery name="clearEnd" datasource="#datasrc#">
			UPDATE #table_forum_entries# SET ThreadCount = #Evaluate(count.MsgCount)# WHERE PostNum = #PostNum#	AND Thread = 1
            AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
		</cfquery>
		
		<cfquery datasource="#datasrc#">
			UPDATE #table_forum_rooms# SET Threads = Threads + 1 WHERE RoomID = #RoomID#
            AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
		</cfquery>
	
	<cfmail query="getThreads" to="#email#" from="#EmailFrom#" subject="Reponse to your eForum post: #form.Title#" server="#smtpServer#">
Subject: #form.Title#
Name: #form.Author# (#form.Email#)

#form.message#

---------------------------------------------------------------
To reply to this message click this link: #URlPath#?module=forum&action=detail&postnum=#PostNum#&roomID=#RoomID#&EntryID=#getNew.maxEntryID#&thread=#Evaluate(getMax.Maxthread+1)#	
---------------------------------------------------------------

ThreadMail Service provided by eForum v1.0	
	</cfmail>
	
<cfelseif Action IS "PostNew">
	
	<CFQUERY name="getmax" datasource="#datasrc#">
		SELECT Max(PostNum) As MaxPostNUm FROM #table_forum_entries#
        where  SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
	</cfquery>	

	<cfif Not Len(getMax.MaxPostNum)>
		<cfset MaxPostNum = 1>
	<cfelse>
		<cfset MaxPostNum = getMax.MaxPostNum + 1 >
	</cfif>
	<CFQUERY name="update" datasource="#datasrc#">		
		INSERT INTO #table_forum_entries#
		(RoomID,Title,Author,Email,Message,PostNum,Thread, CreateDate,ThreadEnd, ThreadCount, siteID)
		VALUES
		(#RoomID#, '#Title#', '#Author#', '#Email#','#Message#', #MaxPostNum#, 1, #CreateODBCDateTime(Now())#, 0, 1, <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">)
	</cfquery>
		
	<cfquery datasource="#datasrc#">
			UPDATE #table_forum_rooms# SET Threads = Threads + 1 WHERE RoomID = #RoomID# AND SiteID = <cfqueryparam cfsqltype="cf_sql_char" value="#session.SiteID#">
	</cfquery>
	
</cfif>

<cflocation url="?module=forum&action=forum&roomID=#RoomID#&flush=1">
</cflock>