<!--- a wrapper designed to the look and feel of the ColdFusion CFIDE Administrator Main Panel 
	Taken from the css styles in other CFIDE Administrator functions.  
	The main content of this code is Adobe's content and their licens.
--->
<cfsetting showDebugOutput="No">
<cfparam name="attributes.title" type="string" default="">
<cfif thistag.ExecutionMode eq "Start" and isDefined("Server.coldfusion.productname") and Server.coldfusion.productname eq "ColdFusion Server">
<html>
<head>
	<cfoutput><title>#attributes.title#</title></cfoutput>	
<style>
body, p, td {
	font-family: Arial, Helvetica, sans-serif;
	font-size: small;
}

th {
 font-family: Arial, Helvetica, sans-serif;
 font-size: small; ! important;
}

th {
 text-align:left;
}

		.buttn
		{
			
			  background: #1e1e1e;
				
			  background: -moz-linear-gradient(top, #999999 0%, #666666 100%);
			  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #999999), color-stop(100%, #666666));
			  background: -webkit-linear-gradient(top, #999999 0%, #666666 100%);
			  background: -o-linear-gradient(top, #999999 0%, #666666 100%);
			  background: -ms-linear-gradient(top, #999999 0%, #666666 100%);
			  background: linear-gradient(top, #999999 0%, #666666 100%);
			  			 
			  		filter: progid:dximagetransform.microsoft.gradient(startColorstr='#999999', endColorstr='#666666', GradientType=0);
			  
			  
			  border-style: solid;
			  border-radius: 4px;
			  border-width: 1px;
			  border-color: #909090;
			  color: #ffffff;
			  font-family: Arial, Helvetica;
			  font-size: 12px;
			  height: 22px;
			  min-width: 100px;
			  outline-style: none;
			  padding-left: 10px;
			  padding-right: 10px;
			  text-shadow: 0px -1px 1px #999999;

			
		}
		
		.buttn:hover
		{
			  color: #ffffff;
			  background: -moz-linear-gradient(top, #aaaaaa 0%, #999999 100%);
			  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #aaaaaa), color-stop(100%, #999999));
			  background: -webkit-linear-gradient(top, #aaaaaa 0%, #999999 100%);
			  background: -o-linear-gradient(top, #aaaaaa 0%, #999999 100%);
			  background: -ms-linear-gradient(top, #aaaaaa 0%, #999999 100%);
			  background: linear-gradient(top, #aaaaaa 0%, #999999 100%);
			  
			  
			  	filter: progid:dximagetransform.microsoft.gradient(startColorstr='#aaaaaa', endColorstr='#999999', GradientType=0); }
				background: #a5a5a5; 
			  
			  
			  color: #dadada;
			  text-shadow: 0px -1px 1px #666666;

		}
		
		
		.buttn:disabled 
		{
		  background: #a5a5a5;
		  color: #dadada;
		  text-shadow: 0 0 0 #0;
		}

		.header 
		{
			height: 100%;
			width: 100%;
			background-color:#666666;
			
		}
		.header a
		{
			color:#eeeeee;
			font-size:14px;	
			font-weight:bold;
		}
.adminbody {
	background-color: #c4c4c4;
}

.resourcelist {
	list-style-type:square;
	margin-top:5px;
	margin-bottom:10px;
}

.errorText {
	color: #CC0000; 
}

.successText {
	color: #008800; 
}

.loginWhiteText {
	color: #FFFFFF; 
	font-weight: bold;
}

.loginInvalidText {
	color: #CC0000; 
	font-weight: bold;
}

.loginCopyrightText {
	color: #000000;
	font-size: 9px;
	font-family:Arial, Helvetica, sans-serif;
}

a {
	color: #5f91b0;
	text-decoration: none;
}

a:hover {
	color: #333333;
	font-weight:normal; 
}

a.tableHeader:hover{
	
color: #333333;

	font-weight:inherit;

}

.iconLinkText {
	color: #FFFFFF;
	font-weight: bold;

	font-size: small;

}

.leftMenuLinkText {
	
color: #666666;

	font-size: small;

}

a.leftMenuLinkText:hover{
	
color: #333333;
font-weight:bold;
}

.leftMenuLinkTextHighlighted {
	
color: #666666; 

	font-size: small;

	font-weight:bold;
}

.topMenuLinkText {
	color: #000000;
	font-size: x-small; 
}

.menuCFAdminText {
	color: #000000;
	font-weight: bold;
	

	font-size: small;

}

.menuAuxText {
	color: #6C7A83;
	
		font-size: small;
	
}

.menuHeaderText {
color: #333333;
	font-weight: bold;

	font-size: x-small;

	text-transform:uppercase;
}

.menuTD {
	/*border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-bottom-color: #CCCCCC;*/
	background: #ececec;
}

.menuTDHeader {
	/* can delete me thinks */
	/*border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;*/
	background: #ececec url('\2f CFIDE\2f administrator\2f images/cap_menuitem_background.png') repeat-x;
}
.menuTDHeaderLeft {
	border-left-style:solid;
	border-left-width: 1px;
	border-color: #c4c4c4;
	background: #ececec url('\2f CFIDE\2f administrator\2f images/cap_menuitem_background.png') repeat-x;
}
.menuTDHeaderRight {
	border-right-style:solid;
	border-right-width: 1px;
	border-color: #c4c4c4;
	background: #ececec url('\2f CFIDE\2f administrator\2f images/cap_menuitem_background.png') repeat-x;
}

h1 {
	color: #000000;
	font-weight: bold;
	font-size: x-small;
	margin-top: 5px;
	margin-bottom: 5px;
}

.pageHeader {
	color: #666666;
	font-weight: bold;
	font-size: medium;
	margin-top: 5px;
	margin-bottom: 5px;
}

.currentuser {
	color: #0072AC;
	font-weight: bold;
	font-size: x-small;
	margin-top: 5px;
	margin-bottom: 5px;
}

.cellBlueSides {
	border-right-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-left-style: solid;
	border-right-color: #C1D9DB;
	border-left-color: #C1D9DB;
}

.cellLeftBlueSide {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #D5E3E6;
}

.cellRightAndBottomBlueSide {
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #D5E3E6;
}

.cell3BlueSides {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #D5E3E6;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #D5E3E6;
}

.cell4BlueSides {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #D5E3E6;
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #D5E3E6;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #D5E3E6;
}

.cell2BlueSidesAndBlueBkgd {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #D5E3E6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #D5E3E6;
	background-color: #E8F0F1;
}

.cellBlueTop {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #C1D9DB;
}

.cellBlueBottom {
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #C1D9DB;
}

.cellBlueTopAndBottom {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #C1D9DB;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #C1D9DB;
}

.cellBordersBlue {
	border: 1px solid #C1D9DB;
}

.cellGrayBottom {
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #E2E6E7;
}

.copyright {
	color: #000000;
	
		font-size: x-small;
	
}

.copyrightLink {
	color:#003399; 
	
		font-size: x-small;
	
}

.disabled {
	color: #999999;	
}
.updatenotification
{
	color: white;
	font-size: small;
	a:hover {color: white;}
	
}


.color-title		{background-color:888885;color:white;background-color:7A8FA4;}
.color-header		{background-color:ddddd5;}
.color-buttons		{background-color:ccccc5;}
.color-border		{background-color:666666;}
.color-row			{background-color:fffff5;}
.color-rowalert		{background-color:ffddaa;}


.labelbold			{font-weight:bold;}

</style>

<style>
	.imgtest{
		background: url(images/serverupdatesstar.png) 0 0 no-repeat;
		width:20px;
		height:22px;
		display:none;
	}
	#textOverlay {
		position:relative;
		top: -3px;
		left: 15px;
		font-size:12px;	
		font-weight:bold;	
		color: #fff;
		text-shadow: #000 2px 2px 2px;
	}

</style>

	<link rel="SHORTCUT ICON" href="/CFIDE/administrator/favicon.ico">
	<meta name="Author" content="&copy; 1997 - 2012 Adobe Systems Incorporated and its licensors. All Rights Reserved.">

</head>

<body style="background:#ececec">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

<tr>
	<td><img src="/CFIDE/administrator/images/contentframetopleft.png" alt="" height="23" width="16"></td><td background="/CFIDE/administrator/images/contentframetopbackground.png"><img src="/CFIDE/administrator/images/spacer.gif" alt="" height="23" width="540"></td><td><img src="/CFIDE/administrator/images/contentframetopright.png" alt="" height="23" width="16"></td>
</tr>
  <tr>
    <td width="16" style="background:url('/CFIDE/administrator/images/contentframeleftbackground.png') repeat-y;"><img src="/CFIDE/administrator/images/spacer.gif" alt="" width="16" height="1"></td>
	<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td width="12"><img src="/CFIDE/administrator/images/cap_content_white_main_top_left.gif" alt="" width="12" height="11"></td>
		    <td bgcolor="#FFFFFF"><img src="/CFIDE/administrator/images/spacer_10_x_10.gif" width="10" alt="" height="10"></td>
			<td width="12"><img src="/CFIDE/administrator/images/cap_content_white_main_top_right.gif" width="12" alt="" height="11"></td>
		  </tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="10" bgcolor="#FFFFFF"><img src="/CFIDE/administrator/images/spacer_10_x_10.gif" alt="" width="10" height="10"></td>
			<td bgcolor="#FFFFFF">				
				<table width="100%" border="0" cellspacing="0" cellpadding="5">
				  <tr valign="top">
					<td valign="top">
<tr>
	<td>&nbsp;</td>
	<td><br />
<!-- margin top -->
<cfelseif thistag.ExecutionMode eq "End">
	<!-- margin bottom -->
		<br />
	</td>
	<td>&nbsp;</td>
</tr>
					</td>
				  </tr>
				</table>
			</td>
		    <td width="10" bgcolor="#FFFFFF"><img src="/CFIDE/administrator/images/spacer_10_x_10.gif" alt="" width="10" height="10"></td>
		  </tr>
		</table>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td width="12"><img src="/CFIDE/administrator/images/cap_content_white_main_bottom_left.gif" alt="" width="12" height="11"></td>
		    <td bgcolor="#FFFFFF"><img src="/CFIDE/administrator/images/spacer_10_x_10.gif" alt="" width="10" height="10"></td>
			<td width="12"><img src="/CFIDE/administrator/images/cap_content_white_main_bottom_right.gif" alt="" width="12" height="11"></td>
		  </tr>
		</table>
		<td width="10" style="background:url('/CFIDE/administrator/images/contentframerightbackground.png') repeat-y;"><img src="/CFIDE/administrator/images/spacer.gif" alt="" width="16" height="1"></td>
	</td>
  </tr>
  <tr>
	<td><img src="/CFIDE/administrator/images/contentframebottomleft.png" height="23" alt="" width="16"></td><td background="/CFIDE/administrator/images/contentframebottombackground.png"><img src="/CFIDE/administrator/images/spacer.gif" alt="" height="23" width="540"></td><td><img src="/CFIDE/administrator/images/contentframebottomright.png" alt="" height="23" width="16"></td>
	</tr>
</table>
		<div align="center">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="20"></td>
		  	<td class="copyright">

This is a custom extension to the Adobe ColdFusion Administrator<br>
Get this on <a href="https://github.com/wiggick/" style="color:##C35617" target="extwebsite" class="copyrightLink">GitHub</a>

<hr noshade="true" size="1" />

Notices, terms and conditions pertaining to third party software are located at <a href="http://www.adobe.com/go/thirdparty#golocale#" style="color:##C35617" target="extwebsite" class="copyrightLink">http://www.adobe.com/go/thirdparty/</a> and incorporated by reference herein.

 

<br>

<br>
			</td>
			<td width="20"></td>
		  </tr>
		</table>
		</div>
</body>
</html>
</cfif>


