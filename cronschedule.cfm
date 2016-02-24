<cfif isDefined("form.adminsubmit")>
	<cfset token=form.csrftoken> 
	<cfset validate = CSRFverifyToken(csrftoken)> 
	<cfif ! validate>
		<cfthrow type="AccessViolation" message="invalid access" />
	</cfif>

	<cfscript>
		//Defaults
		args = StructNew();
		args.action="update";


		argList = "task,group,endDate,endTime,file,operation,password,path,port,proxyPassword,proxyPort,proxyServer,proxyUser,requestTimeOut,resolveURL,result,startDate,startTime,url,username,group,onComplete,eventHandler,onException,cronTime,repeat,priority,exclude,onMisfire,cluster,mode,retryCount";


		for(arg in form){

			if(listFindNoCase(argList,arg))
			{
				
				if(len(trim(form[arg])) neq 0)
				{
					args[arg] = form[arg];
				}
			}
		}
	</cfscript>


	<cfschedule attributeCollection="#args#"/>
		

	<cflocation url="/CFIDE/Administrator/scheduler/scheduletasks.cfm">
</cfif>


<cf_customwrapper title="Cron Scheduler">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="css/cron.css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.auto-grow-input.min.js"></script>
<script type="text/javascript" src="js/cron.js?beta11"></script>
<script type="text/javascript" src="js/cronspeech.js?beta10"></script>
<script type="text/javascript" src="../scripts/util.js"></script>
<script type="text/javascript">
function showHide(targetName) {
	console.log($(targetName).css("display"));
	
	if($(targetName).css("display") == "none"){
		$(targetName).css("display","inline");
	}else{
		$(targetName).css("display","none");
	}
}
</script>

<h2 class="pageHeader"> 
Cron Scheduler
</h2>
<cfset csrfToken=CSRFGenerateToken() /> 
<form name="editForm" method="post">
<cfoutput><input type="hidden" name="csrftoken" value="#csrfToken#"></cfoutput>

<table class="crontable">
<tr>
<td colspan="3" valign="top">
<p class="info">
Click, Click and Drag to select an item or range<br>
Control Key Click, or Control Key Click and Drag to select discontinious items or ranges<br>
</p>


<input type="hidden" name="ScheduleType" value="crontime">
<input id="minutesVal" type="hidden" value="*">
<input id="hoursVal" type="hidden" value="*">
<input id="monthdaysVal" type="hidden" value="*">
<input id="monthsVal" type="hidden" value="*">
<input id="dowVal" type="hidden" value="?">
<span class="label">Cron Time:</span>
<input id="cron" name="crontime" type="text" value="0 * * * * ?" size="14"><br>
<input type="button" id="speakCron" value="Speak Cron" /> (Chrome)<br>
<br>
<input type="button" id="reset" value="Reset" onClick="resetCron();" />
</td>
</tr>
<tr>
<td valign="top">
<p style="clear: right;">
<span class="label">Minutes:</span> Use Increments (single minute selection only): <select id="mininc"><option></option></select><br>
</p>
<div id="minutecontainer" style="clear: right">
<ol id="minutes" class="selectable"> 
<li class="ui-widget-content">0</li>
<li class="ui-widget-content">1</li>
<li class="ui-widget-content">2</li>
<li class="ui-widget-content">3</li>
<li class="ui-widget-content">4</li>
<li class="ui-widget-content">5</li>
<li class="ui-widget-content">6</li>
<li class="ui-widget-content">7</li>
<li class="ui-widget-content">8</li>
<li class="ui-widget-content">9</li>
<li id="break" class="ui-widget-content">10</li>
<li  class="ui-widget-content">11</li>
<li class="ui-widget-content">12</li>
<li class="ui-widget-content">13</li>
<li class="ui-widget-content">14</li>
<li class="ui-widget-content">15</li>
<li class="ui-widget-content">16</li>
<li class="ui-widget-content">17</li>
<li class="ui-widget-content">18</li>
<li class="ui-widget-content">19</li>
<li id="break" class="ui-widget-content">20</li>
<li  class="ui-widget-content">21</li>
<li class="ui-widget-content">22</li>
<li class="ui-widget-content">23</li>
<li class="ui-widget-content">24</li>
<li class="ui-widget-content">25</li>
<li class="ui-widget-content">26</li>
<li class="ui-widget-content">27</li>
<li class="ui-widget-content">28</li>
<li class="ui-widget-content">29</li>
<li id="break" class="ui-widget-content">30</li>
<li class="ui-widget-content">31</li>
<li class="ui-widget-content">32</li>
<li class="ui-widget-content">33</li>
<li class="ui-widget-content">34</li>
<li class="ui-widget-content">35</li>
<li class="ui-widget-content">36</li>
<li class="ui-widget-content">37</li>
<li class="ui-widget-content">38</li>
<li class="ui-widget-content">39</li>
<li id="break"  class="ui-widget-content">40</li>
<li class="ui-widget-content">41</li>
<li class="ui-widget-content">42</li>
<li class="ui-widget-content">43</li>
<li class="ui-widget-content">44</li>
<li class="ui-widget-content">45</li>
<li class="ui-widget-content">46</li>
<li class="ui-widget-content">47</li>
<li class="ui-widget-content">48</li>
<li class="ui-widget-content">49</li>
<li id="break" class="ui-widget-content">50</li>
<li class="ui-widget-content">51</li>
<li class="ui-widget-content">52</li>
<li class="ui-widget-content">53</li>
<li class="ui-widget-content">54</li>
<li class="ui-widget-content">55</li>
<li class="ui-widget-content">56</li>
<li class="ui-widget-content">57</li>
<li class="ui-widget-content">58</li>
<li class="ui-widget-content">59</li>
</ol>
</div>
</td>
<td valign="top">
<span class="label">Hours:</span> Use Increments (single hour selection only): <select id="hourinc"><option></option></select><br>
<ol id="hours" class="selectable"> 
<li class="ui-widget-content">0</li>
<li class="ui-widget-content">1</li>
<li class="ui-widget-content">2</li>
<li class="ui-widget-content">3</li>
<li class="ui-widget-content">4</li>
<li class="ui-widget-content">5</li>
<li class="ui-widget-content">6</li>
<li class="ui-widget-content">7</li>
<li class="ui-widget-content">8</li>
<li class="ui-widget-content">9</li>
<li class="ui-widget-content">10</li>
<li  class="ui-widget-content">11</li>
<li id="break" class="ui-widget-content">12</li>
<li class="ui-widget-content">13</li>
<li class="ui-widget-content">14</li>
<li class="ui-widget-content">15</li>
<li class="ui-widget-content">16</li>
<li class="ui-widget-content">17</li>
<li class="ui-widget-content">18</li>
<li class="ui-widget-content">19</li>
<li class="ui-widget-content">20</li>
<li class="ui-widget-content">21</li>
<li class="ui-widget-content">22</li>
<li class="ui-widget-content">23</li>
</ol>
<br style="clear:both">
<br>
<span class="label">Days of Week:</span><br>
<input type="radio" name="optDOW" id="optDOWstd" value="standard" checked>Standard<br>
<input type="radio" name="optDOW" id="optDOWinc"  value="increment">Use Increments (single day selection only):<select id="dowinc"><option></option></select><br>
<input type="radio" name="optDOW" id="optDOWocc"  value="occurence">Occurence of weekday (3rd monday of the month):<select id="dowocc"><option></option>
<option value="#1">1st</option>
<option value="#2">2nd</option>
<option value="#3">3rd</option>
<option value="#4">4th</option>
<option value="#5">5th</option>
</select><br>
<ol id="daysofweek" class="selectable"> 
<li class="dow ui-widget-content weekday">SUN</li>
<li class="dow ui-widget-content weekday">MON</li>
<li class="dow ui-widget-content weekday">TUE</li>
<li class="dow ui-widget-content weekday">WED</li>
<li class="dow ui-widget-content weekday">THU</li>
<li class="dow ui-widget-content weekday">FRI</li>
<li class="dow ui-widget-content weekday">SAT</li>
</ol>
</td>
<td valign="top">
<span class="label">Months:</span> Use Increments (single month selection only): <select id="monthinc"><option></option></select><br>
<ol id="months" class="selectable"> 
<li class="ui-widget-content">1</li>
<li class=" ui-widget-content">2</li>
<li class=" ui-widget-content">3</li>
<li class=" ui-widget-content">4</li>
<li class=" ui-widget-content">5</li>
<li class=" ui-widget-content">6</li>
<li class=" ui-widget-content">7</li>
<li class=" ui-widget-content">8</li>
<li class=" ui-widget-content">9</li>
<li class=" ui-widget-content">10</li>
<li class=" ui-widget-content">11</li>
<li class=" ui-widget-content">12</li>
</ol>
<br style="clear:both">
<br>
<span class="label">Days of Month:</span> <br>
<input type="radio" id="optdomstd" name="optMonth" value="standard" checked="checked">Standard<br>
<input type="radio" id="optdominc" name="optMonth" value="increment">Use Increments (single day selection only): <select id="dominc"><option></option></select><br>
<input type="radio" id="optdomoff" name="optMonth" value="L">Use "L" such as last day of Month (no day selected), offset <select id="domoffset"><option>L</option></select><br>


<ol id="daysofmonth" class="selectable"> 
<li class="ui-widget-content">1</li>
<li class="ui-widget-content">2</li>
<li class="ui-widget-content">3</li>
<li class="ui-widget-content">4</li>
<li class="ui-widget-content">5</li>
<li class="ui-widget-content">6</li>
<li class="ui-widget-content">7</li>
<li class="ui-widget-content">8</li>
<li class="ui-widget-content">9</li>
<li class="ui-widget-content">10</li>
<li  id="break" class="ui-widget-content">11</li>
<li class="ui-widget-content">12</li>
<li class="ui-widget-content">13</li>
<li class="ui-widget-content">14</li>
<li class="ui-widget-content">15</li>
<li class="ui-widget-content">16</li>
<li class="ui-widget-content">17</li>
<li class="ui-widget-content">18</li>
<li class="ui-widget-content">19</li>
<li class="ui-widget-content">20</li>
<li id="break" class="ui-widget-content" >21</li>
<li class="ui-widget-content">22</li>
<li class="ui-widget-content">23</li>
<li class="ui-widget-content">24</li>
<li class="ui-widget-content">25</li>
<li class="ui-widget-content">26</li>
<li class="ui-widget-content">27</li>
<li class="ui-widget-content">28</li>
<li class="ui-widget-content">29</li>
<li class="ui-widget-content">30</li>
<li  id="break"class="ui-widget-content">31</li>
</ol>
</td>
</tr>
<tr>
<td colspan="3">
	<table width="100%">
		<tr>
		<td class="cellBlueTopAndBottom" bgcolor="#F3F7F7">&nbsp;</td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td>
				<b><label for="task">Task Name</label></b> &nbsp;</font>
			</td>
			<td>
				<input type="text" maxlength="150" name="task" value="" size="35" id="taskname">
			</td>
		</tr>
		
		<tr>
			<td>
				<b><label for="group">Group</label></b> &nbsp;</font>
			</td>
			<td>
				<input type="text" maxlength="150" name="Group"  
	                   value="default" size="35" id="group">
			</td>
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="grp_desc"> The group to which the task belongs. </label>
		 </td>
		</tr>
		
		
			<tr>
				<td nowrap>
					<b><label for="startdate"> Duration</label></b>
				</td>
				<td>
				 
					<label for="startdate"> Start Date</label>
					&nbsp;&nbsp;
					<input name="startdate" type="text" maxlength="30" size="8" title="Start Date(mm/dd/yyyy)" value="02&#x2f;24&#x2f;16" id="Start_Date">
					&nbsp;&nbsp;
					<label for="enddate"> End Date (optional)</label>
					&nbsp;&nbsp;
					<input name="enddate" id="enddate" type="text" title="End Date(mm/dd/yyyy)" maxlength="30" size="8" value="">
				</td>
			</tr>
	</table>
		<table>
			<tr>
			<td>
				<label for="url"><b> URL</b></label>
			</td>
			<td>
			
				<input name="url" id="ScheduledURL" type="text" maxlength="550" size="35" style="width:35em;" class="label" value="" title="URL of the page to execute" id="label">
			</td>
		</tr>
		<tr>
			<td>
				<b><label for="username"> User Name</label></b>
			</td>
			<td>
				<input class="text" name="Username" type="text" maxlength="550" size="15" style="width:15em" value="" id="username" title="User Name">
			</td>
		</tr>
		<tr>
			<td>
				<b><label for="password"> Password</label></b>
			</td>
			<td>
				<input name="Password" type="password" size="15" style="width:15em" value="" id="password" title="Password" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td>
			
				<b><label for="requestTimeOut"> Timeout (in seconds)</label></b>
			</td>
			<td>
				<input name="requestTimeOut" type="text" maxlength="550" title="Request Time Out in Seconds"  size="4" value="" id="request_timeout">
			</td>
		</tr>
		<tr>
			<td>
				<b><label for="proxyserver">  Proxy Server</label></b>
			</td>
			<td>
				
				<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<input name="proxyserver" type="text" maxlength="550" size="15" value="" title="Proxy Server" id="proxy_server">
					</td>
					<td>
						&nbsp;&nbsp;
					</td>
					<td>
					
						<b><label for="proxyport">  Port</label></b>
						
						<input class="text" name="proxyport" type="text" maxlength="50" size="4" value="" title="HTTP Proxy Port" id="http_proxy_port">
					</td>
				</tr>
				</table>
				
			</td>
		</tr>
		
			<tr>
				<td>
					<b><label for="proxyuser">  Proxy User</label></b>
				</td>
				<td>
					
					<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<input name="proxyuser" type="text" maxlength="550" size="15" value="" title="Proxy User" id="proxy_user">
						</td>
						<td>
							&nbsp;&nbsp;
						</td>
						<td>
						
							<b><label for="proxypassword">  Password</label></b>
							
							<input name="proxypassword" type="password" size="15" style="width:15em" value="" title="HTTP Proxy Password" id="proxy_password" autocomplete="off">
						</td>
					</tr>
					</table>
					
				</td>
			</tr>
		
		<!---<tr>
			<td>
				<b><label for="publish"> Publish </label></b>
			</td>
			<td>	
				<input name="publish" id="publish" type="checkbox" onclick="showHide('#filetable');" title="Save output to a file." value=1>
				<label for="publish">Save output to a file.</label>
			</td>
		</tr>--->
	</table>
	<!---
	<table style="display:none"  id="filetable" border="0" cellpadding="5" cellspacing="0">        
		<tr>
			<td>
			    <b><label for="path"> File</label></b>
			</td>
			<td>			 
				<input name="publish_file" value="" type="text" maxlength="550" size="25" style="width:15em" id="publish_file" title="File Path">		        
				<input type="button" class="buttn" title="Browse Server"  name="browsesubmit" value="Browse Server" onclick='wopen("publish_file");'>
			 </td>
		</tr>
		<tr>
			<td>
				<b><label for="path"> Overwrite</label></b>
			</td>	
			<td>
				<input name="publish_overwrite"  type="checkbox"  id="overwrite" title="Overwrite" checked>
			 </td>
		</tr>
	</table>
	--->	
	<table>
		<tr>
			<td>
				<b><label for="resolve_url"> Resolve URL</label></b>
			</td>
			<td>
				<input name="ResolveURL" type="checkbox" value="1" title="Resolve internal URLs so that links remain intact."
				id="resolve_url">
			<label for="resolve_url">Resolve internal URLs so that links remain intact.</label>
			</td>
		</tr>
	</table>

	
	<table border="0" cellpadding="5" cellspacing="0" id="advancetable" style="display:none">


		<tr>
			<td>
				<label for="eventhandler"><b> Event Handler</b></label>
			</td>
			<td>
				<input name="eventhandler" id="eventhandler" type="text" maxlength="550" size="35" 
                       style="width:35em;" class="label" value="" 
                        id="label">
			</td>
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="eh"> Specify a dot-delimited CFC path under webroot, for example a.b.server (without the CFC extension). The CFC should implement CFIDE.scheduler.ITaskEventHandler.</label>
		 </td>
		</tr>
		<tr>
			<td>
				<label for="exclude"><b> Exclude </b></label>
			</td>
			<td>
			
				<input name="exclude" id="exclude" type="text" maxlength="550" size="35" style="width:35em;" 
                        class="label" value=""  id="label">
			</td>
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="exclude"> Comma-separated list of dates or date range for exclusion in the schedule period.</label>
		 </td>
		</tr>
		<tr>
                    <td>  
		         <label for="Scheduledeventhandler"><b> On Misfire </b></label>
		    </td>

		    <td> 
			<select name="onmisfire" id="onmisfire">
			 <option value="" selected>Ignore
			   <option value="FIRE_NOW" >Fire now
                             <option value="INVOKEHANDLER" >Invoke handler
	               
			</select>
		    </td>
                    
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="misfire"> Specify what the server has to do if a scheduled task misfires.</label>
		 </td>
		</tr>
		<tr>
                    <td>  
		         <label for="onexception"><b> On Exception </b></label>
		    </td>

		    <td> 
			<select name="onexception" id="onexception">
			  <option value="" selected>Ignore
	                   <option value="pause" >Pause
			    
			     <option value="refire" >Re-Fire
			     <option value="invokehandler" >Invoke handler
			     
			</select>
		    </td>
                    
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="exception"> Specify what to do if a task results in error.</label>
		 </td>
		</tr>
		<tr>
			<td>
				<label for="oncomplete"><b> On Complete </b></label>
			</td>
			<td>
				
				<input name="oncomplete" id="oncomplete" type="text" maxlength="550" size="35" 
style="width:35em;" class="label" value="" title="task:group:mode" 
id="label">
			</td>
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="chain"> Comma-separated list of chained tasks to be run after the completion of the current task (task1:group1,task2:group2...)</label>
		 </td>
		</tr>
		<tr>
			<td>
				<label for="priority"><b>  Priority</b></label>
			</td>
			<td>
				<input name="priority" id="priority" type="text" maxlength="100" size="4" 
 class="label" value="5" 
id="label">
			</td>
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="priority">  An integer that indicates the priority of the task.</label>
		 </td>
		</tr>
		<tr>
			<td>
				<label for="retrycount"><b>  Retry 
Count</b></label>
			</td>
			<td>
				<input name="retrycount" id="retrycount" type="text" maxlength="100" size="4" 
class="label" value="3" 
id="label">
			</td>
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="rc"> The number of reattempts if the task results in an error.</label>
		 </td>
		</tr>
		<tr>
			<td>
				<b><label for="cluster">  Cluster</label></b>
			</td>
			<td>
				<input name="cluster" type="checkbox" value="1" 
					
				id="cluster">
				<label for="cluster"> </label>
			</td>
		</tr>
		<tr>
		 <td colspan=2>
		   <label for="cluster">  If checked, the task can be executed in cluster setup.</label>
		 </td>
		</tr>
		</table>

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td class="cellBlueTopAndBottom" bgcolor="#F3F7F7">
			 
			
			<input type="button" name="hideunhidebutton" id="hideunhidebutton" title="Show Additional Settings" value="Show Additional Settings" class="buttn" onclick="showhide('advancetable');toggletext('hideunhidebutton','Hide Additional Settings','Show Additional Settings');">
			<input type="hidden" name="advancedmode" value="true">
	</td>
</tr>
</table>

<br />

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td class="cellBlueTopAndBottom" bgcolor="#F3F7F7">
		<input type="Submit" class="buttn"  value="Submit" name="adminsubmit" title="Submit">
		<input type="Submit" class="buttn"  value="Cancel" name="cancel" title="Cancel">
	</td>
</tr>
</table>


</td>
</tr>
</table>
</form>
</cf_customwrapper>