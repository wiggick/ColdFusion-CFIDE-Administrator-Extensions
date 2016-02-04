<cf_customwrapper title="Session Tracker">

<cfscript>
	/**
 * Converts an array of structures to a CF Query Object.
 * 6-19-02: Minor revision by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * Update to handle empty array passed in. Mod by Nathan Dintenfass. Also no longer using list func.
 * 
 * @param Array 	 The array of structures to be converted to a query object.  Assumes each array element contains structure with same  (Required)
 * @return Returns a query object. 
 * @author David Crawford (dcrawford@acteksoft.com) 
 * @version 2, March 19, 2003 
 */
function arrayOfStructuresToQuery(theArray){
	var colNames = "";
	var theQuery = queryNew("");
	var i=0;
	var j=0;
	//if there's nothing in the array, return the empty query
	if(NOT arrayLen(theArray))
		return theQuery;
	//get the column names into an array =	
	colNames = structKeyArray(theArray[1]);
	//build the query based on the colNames
	theQuery = queryNew(arrayToList(colNames));
	//add the right number of rows to the query
	queryAddRow(theQuery, arrayLen(theArray));
	//for each element in the array, loop through the columns, populating the query
	for(i=1; i LTE arrayLen(theArray); i=i+1){
		for(j=1; j LTE arrayLen(colNames); j=j+1){
			querySetCell(theQuery, colNames[j], theArray[i][colNames[j]], i);
		}
	}
	return theQuery;
}


	 sessiontrackerObj= createObject("java","coldfusion.runtime.SessionTracker");
	 objServerMonitor = new CFIDE.adminapi.servermonitoring();
	 //aScopes = objServerMonitor.getAllApplicationScopesMemoryUsed();
	 //lstApps = StructKeyList(aScopes);
</cfscript>
	
<cfparam name="result" default="">
   <cfset qrySessions = arrayOfStructuresToQuery(objServerMonitor.getAllActiveSessions())>
   
   <cfquery name="qryGroupedSessions" dbtype="query">
   	 select appName,cfsessionid,sessionID,clientIPAddress,ELAPSEDTIME,MAXINACTIVEINTERVAL,SESSIONSIZE,TIMESINCELASTACCESS
   	 FROM qrySessions
   	 order by appName asc, TIMESINCELASTACCESS desc
   </cfquery>
   
 

<h2 class="pageHeader"> 
Sessions
</h2>
<br>
<cfoutput>
Current Sessions as of #now()#
</cfoutput>
<br><br>

<table border="0" cellpadding="5" cellspacing="0" width="100%">
	<tr>
		<td bgcolor="#E2E6E7" class="cellBlueTopAndBottom">
			<b>Sessions</b>
		</td>
	</tr>
	<tr>
		<td>	
			<table border="0" cellpadding="2" cellspacing="0" width="100%">
				<cfset csrfToken=CSRFGenerateToken() /> 
				<cfset request.overallTotal = 0 />
				<cfoutput query="qryGroupedSessions" group="appName">
					<cfset activesessions = sessiontrackerObj.getSessionCollection(appName)>
					<thead>
						<tr>
							<th colspan="7" nowrap bgcolor="##F3F7F7" class="cellBlueTopAndBottom">
								<strong>Application: #qryGroupedSessions.appName#</strong>
							</th>
						</tr>
						<tr>
							<th nowrap bgcolor="##F3F7F7" class="cellBlueTopAndBottom">
								<strong>Session ID</strong>
							</th>
							<th nowrap bgcolor="##F3F7F7" class="cellBlueTopAndBottom">
								<strong>Client IP</strong>
							</th>
							<th nowrap bgcolor="##F3F7F7" class="cellBlueTopAndBottom">
								<strong>ELAPSEDTIME</strong>
							</th>
							<th nowrap bgcolor="##F3F7F7" class="cellBlueTopAndBottom">
								<strong>MAXINACTIVEINTERVAL</strong>
							</th>
							<th nowrap bgcolor="##F3F7F7" class="cellBlueTopAndBottom">
								<strong>SESSIONSIZE</strong>
							</th>
							<th nowrap bgcolor="##F3F7F7" class="cellBlueTopAndBottom">
								<strong>TIMESINCELASTACCESS</strong>
							</th>					
						</tr>
					</thead>
					<tbody>
				<cfoutput>
					<tr>
						<td nowrap class="cellRightAndBottomBlueSide">
							#sessionID#
						</td>
						<td nowrap class="cellRightAndBottomBlueSide">
							#clientIPAddress#
						</td>
						<td nowrap class="cellRightAndBottomBlueSide">
							#ELAPSEDTIME#
						</td>
						<td nowrap class="cellRightAndBottomBlueSide">
							#MAXINACTIVEINTERVAL#
						</td>
						<td nowrap class="cellRightAndBottomBlueSide">
							#SESSIONSIZE#
						</td>
						<td nowrap class="cellRightAndBottomBlueSide">
							#TIMESINCELASTACCESS#
						</td>
					</tr>
				</cfoutput> 
					</tbody>
				
			</cfoutput>
			</table>
	</td>
</tr>
</table>
<br><br>

</cf_customwrapper>




