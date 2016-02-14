<cf_customwrapper title="Cron Scheduler">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="css/cron.css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/cron.js"></script>
<script type="text/javascript" src="js/cronspeech.js"></script>

<h2 class="pageHeader"> 
Cron Scheduler
</h2>
<table class="crontable">
<tr>
<td colspan="3" valign="top">
<p class="info">
Click, Click and Drag to select an item or range<br>
Control Key Click, or Control Key Click and Drag to select discontinious items or ranges<br>
</p>
<input id="minutesVal" type="hidden" value="*">
<input id="hoursVal" type="hidden" value="*">
<input id="monthdaysVal" type="hidden" value="*">
<input id="monthsVal" type="hidden" value="*">
<input id="dowVal" type="hidden" value="*">


<span class="label">Cron Value:</span>
<input id="cron" name="cron" type="text" value="* * * *" size="60">
<input type="button" id="speakCron" value="Speak Cron" />(Chrome)
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
<td>

</td>
<td>

</td>
</tr>
</table>

</cf_customwrapper>