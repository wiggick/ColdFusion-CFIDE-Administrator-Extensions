  <cfparam name="result" default="">
  <!--- 
  @author Christopher Wigginton
  The only credit I take is wrapping the work of Upendra into the visual UI created by Adobe for the ColdFusion CFIDE administrator.
  These functions written by Upendra Roul (<http://coldfusion-tip.blogspot.com/2012/02/kill-coldfusion-thread-using-admin-api.html )
  --->
  <cf_customwrapper title="Thread Tracker">
   <cffunction name="getAllActiveThreads" access="public" description="Returns all currently active threads." output="false" returntype="Array">
      
        <cfscript>
            local.returnedObject = arrayNew(1);           
            try{
                
                local.monitorObj = createobject("component","cfide.adminapi.servermonitoring");   
                
                //Get all active thread information
                local.returnedObject = local.monitorObj.getAllActiveCFThreads();
                             
            } catch(Any e){
            	WriteDump(e);
            }
            return local.returnedObject;
        </cfscript>
    </cffunction>
    
    <cffunction name="killActiveThread" access="public" description="Kill active cfthread" output="false" returntype="any">
        <cfargument name="threadName" required="true" type="string" hint="The thread name. It can be cfthread name or THREADNAME  of the thread Object" />
       
        <cfscript>
            try{
                
                local.monitorObj = createobject("component","cfide.adminapi.servermonitoring");
                              
                //kill the thread 
                local.killedThread = local.monitorObj.abortCFThread(arguments.threadName);
                              
                return "The thread:#arguments.threadName# has been killed sucessfully!";
            } catch(Any e) {
            	WriteDump(e);
                return e.message;
            }
        </cfscript>
    </cffunction>
    
<cfif isDefined("url.action") and url.action eq "kill">
	   <cfif ! CSRFverifyToken(url.csrfToken)> 
	   		<cfthrow type="invalidAccess" Message="Invalid Access">
	   </cfif>
		
	<cfset killActiveThread(url.thread)> 
	<cfset result ="Thread #url.thread# may not stop immediately, click on the Thread navigation to refresh">
	
</cfif>

<cfif isDefined("form.testthread")>
	  <cfset timer = now()>
	  <cfset endtime = DateAdd("n",2,timer)>
	  <cfthread name="test_#createUUID()#">
	  		<cfloop condition="timer lt endTime">
	  				<!--- do nothing --->
	  		</cfloop>
	  </cfthread>
	
</cfif>

<h2 class="pageHeader"> 
Threads
</h2>
<br>
Currently running threads
<br><br>
<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#E2E6E7" class="cellBlueTopAndBottom">
		<b>Running Threads</b>
	</td>
</tr>
<cfif len(trim(result)) neq 0>
	<tr>
		<th colspan="4">
			<cfoutput>#result#</cfoutput>
		</th>
	</tr>
</cfif>
<tr>
	<td>
		
		<table border="0" cellpadding="2" cellspacing="0" width="100%">
		<tr>
			<th scope="col" nowrap bgcolor="#F3F7F7" class="cellBlueTopAndBottom">
				<strong> Actions </strong>
			</th>
			<th scope="col" nowrap bgcolor="#F3F7F7" class="cellBlueTopAndBottom">
				<strong>Thread Name</strong>	
			</th>
			<th scope="col" nowrap bgcolor="#F3F7F7" class="cellBlueTopAndBottom">
				<strong>Spawned From</strong>
			</th>
			<th scope="col" nowrap bgcolor="#F3F7F7" class="cellBlueTopAndBottom">
				<strong>Time Taken</strong>
			</th>
		</tr>
								
				<cfset csrfToken=CSRFGenerateToken() />
				
				<cfset arThreads = getAllActiveThreads()>
				<cfif ArrayLen(arThreads) gt 0>
					<cfloop from="1" to="#ArrayLen(arThreads)#" index="i">
						<cfset threadInfo = arThreads[i]>
						<cfoutput>
						<tr>
							<td nowrap class="cellRightAndBottomBlueSide" width="125">
								<a href="/CFIDE/administrator/extensionscustom/threads.cfm?action=kill&thread=#threadInfo['THREADNAME']#&csrfToken=#csrfToken#" onclick="return confirm('Are you sure you want to kill thread #threadInfo['CFTHREADNAME']#');"><img src="/CFIDE/administrator/images/delete_button.gif" vspace="2" hspace="2" width="16" height="16" alt="Kill Thread" title="Kill Thread" border="0"></a>
							</td>
							<td nowrap class="cellRightAndBottomBlueSide">
								#threadInfo['CFTHREADNAME']#					
							</td>
							<td nowrap class="cellRightAndBottomBlueSide">
								#threadInfo['SPAWNEDFROM']#				
							</td>
							<td nowrap class="cellRightAndBottomBlueSide">
								#threadInfo['TIMETAKEN']#
							</td>
						</tr>
						</cfoutput>
					</cfloop>
				</cfif>
			
			<tr>
				<td colspan="6" bgcolor="#E2E6E7" class="cellBlueTopAndBottom">
					&nbsp;
				</td>
			</tr>
			
		</table>
		<br><br>
		<!---<form method="post"><input type="submit" name="testthread" value="Create Test Thread"></form>--->
		
	</td>
</tr>
</table>
<br><br>
</cf_customwrapper>
