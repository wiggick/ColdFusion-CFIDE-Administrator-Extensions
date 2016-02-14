//Chrome only
/**
Functions for providing text to speech of crontab settings.
Spelling of phrases modified to be more phonetic for the text to speech processing.
@author: Christopher Wigginton
@verison 1.0
@license: MIT License
*/
function speak(text) {
    var msg = new SpeechSynthesisUtterance();
    var voices = speechSynthesis.getVoices();
    msg.voice = voices[10];
    msg.voiceURI = 'native';
    msg.volume = 1;
    msg.rate = 1;
    msg.pitch = 2;
    msg.text = text;
    msg.lang = 'en-US'; 
    speechSynthesis.speak(msg);
}

function speakCron(){
	speak("This krahn-tab will ruhn ");
	speakMonths();
	
	//if day of week selected and day of month = * only mention weekday
	speakDaysOfMonth();
	speakDaysOfWeek();
	speakHours();
	speak("and");
	speakMinutes();



}

function speakMinutes(){
	$txtSpeech = $('#minutesVal');
	
	if($txtSpeech.val() == '')
		return;
		
	if($txtSpeech.val() == '*'){
		speak("every minute");
		return;
	}else {		
	
	
			if($txtSpeech.val() == '0'){
				speak('at the top of the hour');
				return;
			}
			
			var arRange = $txtSpeech.val().split("/");
			if(arRange.length > 1){
				
				if(arRange[0] == '0'){
					result = "at the top of the hour ";
				}else{
					result = "at minit ";
					result +=  number2text(arRange[0]);
				}
				
				result += " and every " + number2text(arRange[1]) + " minutes after";
				
			}else {		
				result = processItem("'minit", $txtSpeech.val());
			}
			speak(result);		
	}
}

function speakHours(){
	$txtSpeech = $('#hoursVal');
	
	if($txtSpeech.val() == '')
		return;
			
	if($txtSpeech.val() == '*'){
		speak("every Hour");
		
	}else {	
		var arRange = $txtSpeech.val().split("/");
			if(arRange.length > 1){
				result = "at hour ";
				result +=  number2text(arRange[0]);
				result += " and every " + number2text(arRange[1]) + " hours after";
			}else{
					
				result = processItem('hour',$txtSpeech.val());
			}
		speak(result);		
	}
}

function speakMonths(){
	
	$txtSpeech = $('#monthsVal');
	
	if($txtSpeech.val() == '')
		return;
			
	if($txtSpeech.val() == '*'){
		speak("every muhnth");
		
	}else {		
					
		result = processMonth($txtSpeech.val());
		speak(result);		
	}
}

function speakDaysOfWeek(){
	
	$txtSpeech = $('#dowVal');
			
	if($txtSpeech.val() == '*'){
		speak("every day of the week");
		
	}else {		
					
		result = processDOW($txtSpeech.val());
		speak(result);		
	}
}

function speakDaysOfMonth(){
	
	$txtSpeech = $('#monthdaysVal');
	
	
	//check if value  is * and look at days of week, if
	//days of week does not = *, then skip this ...
	
	$dowSpeech =  $('#dowVal');
	
	
	if($dowSpeech.val() != '*' && $txtSpeech.val() == '*'){
		return;
	}
		
	
	if($txtSpeech.val() == 'L'){
		speak("on the last day of the month");
		return;
	}
	
	if($txtSpeech.val().length > 2 && $txtSpeech.val().substring(0,1) == 'L'){
		aryLOffset = $txtSpeech.val().split('-');
		
		strOffset = number2text(aryLOffset[1]);
		speak(strOffset + ' days to last day of the month');
		
		return;
	}
			
	if($txtSpeech.val() == '*'){
		speak("every month day");
		
	}else {		
		    var arRange = $txtSpeech.val().split("/");
			if(arRange.length > 1){
				
				
					result = "at day ";
					result +=  number2text(arRange[0]);
				
				
				result += " and every " + number2text(arRange[1]) + " days after";
				
			}else {		
				result = processItem("month day",$txtSpeech.val());
			}			
		
		speak(result);		
	}
	
	if($txtSpeech.val() != '*' && $dowSpeech.val() != '*'){
		speak("where those days fall ");
	}
}



function processDOW(item){
	stDOW = {"SUN":"suhn-dey","MON":"muhn-dey","TUE":"tooz-dey","WED":"wenz-dey","THU":"thurz-dey","FRI":"frahy-dey","SAT":"sat-r-dey"};
	aryOCC = ['First','Second','Third','Forth','Fifth'];
	
	var aryItems = item.split(",");
	var result = "";
	var reRange = /([0-9]*)-([0-9]*)/;
	
	var aryIncrement = item.split("/");
	
	if (aryIncrement.length > 1){
		
		result += "on weekday " +  stDOW[aryIncrement[0]];
		result += "and every " + number2text(aryIncrement[1]) + " days after";
		return result;
	}
	
	var aryOccurence = item.split("#");
	if (aryOccurence.length > 1){
		
		var idxOCC = aryOccurence[1]-1;
		console.log("idxOCC");
		console.log(idxOCC);
		result += 'on the ' + aryOCC[idxOCC];	
		result +=  stDOW[aryOccurence[0]] + ' of the month.';
		
		return result;
	}

	for (i = 0; i < aryItems.length; i++) { 
		var sub_item = aryItems[i];
		if(reRange.test(sub_item)){
			var arRange = sub_item.split("-");
	
			result +=   stDOW[arRange[0]]; 	
			result += " throo  " + stDOW[arRange[1]]; 	
			
		}else{
			
			result +=  stDOW[sub_item]; 
		}
		
		if(i+1 < aryItems.length){
			result += " and ";
		}
		
	}
	return  "on weekdays " + result;
}

function processMonth(item){
	aryMonths = ['January','February','March','April','May','June','July','August','September','October','November','December'];
	
	var arRange = $txtSpeech.val().split("/");
	if(arRange.length > 1){
		result = "on ";
		result +=  aryMonths[parseInt(arRange[0]) -1];
		
		result += " and every " + number2text(arRange[1]) + " months after";
		return result;
	}
	
	
	var aryItems = item.split(",");
	var result = "";
	var reRange = /([0-9]*)-([0-9]*)/;
	
	for (i = 0; i < aryItems.length; i++) { 
		var sub_item = aryItems[i];
		if(reRange.test(sub_item)){
			var arRange = sub_item.split("-");
			var intStartMonth = parseInt(arRange[0]) - 1;
			var intEndMonth = parseInt(arRange[1]) - 1;
			result += "During months's " +  aryMonths[intStartMonth]; 
			
			result += " throo  " + aryMonths[intEndMonth]; 
			
		}else{
			var intStartMonth = parseInt(sub_item) - 1;
			result += "During the month of "  +  aryMonths[intStartMonth]; 
		}
		
		if(i+1 < aryItems.length){
			result += " and ";
		}
		
	}
	return result;
}


function processItem(type,item){
	var aryItems = item.split(",");
	var result = "";
	var reRange = /([0-9]*)-([0-9]*)/;
	
	for (i = 0; i < aryItems.length; i++) { 
		var sub_item = aryItems[i];
		if(reRange.test(sub_item)){
			var arRange = sub_item.split("-");
		
			result += "at " + type + 's ' + number2text(arRange[0]); 
			
			result += " throo  " + number2text(arRange[1]); 
			
		}else{
			result += "at " + type + ' ' + number2text(sub_item);	
		}
		
		if(i+1 < aryItems.length){
			result += " and ";
		}
		
	}
	return result;
}
/*Function via SlashDot http://stackoverflow.com/questions/5529934/javascript-numbers-to-words
Hiardik Thaker:  http://stackoverflow.com/users/1635859/hardik-thaker
*/
function number2text(value) {
    var fraction = Math.round(frac(value)*100);
    var f_text  = "";

    if(fraction > 0) {
        f_text = "AND "+convert_number(fraction)+" PAISE";
    }

    return convert_number(value);
}

function frac(f) {
    return f % 1;
}

function convert_number(number)
{
    if ((number < 0) || (number > 999999999)) 
    { 
        return "NUMBER OUT OF RANGE!";
    }
    var Gn = Math.floor(number / 1000000);  /* million */ 
    number -= Gn * 10000000; 
    var kn = Math.floor(number / 100000);     /* hundred thousand */ 
    number -= kn * 100000; 
    var Hn = Math.floor(number / 1000);      /* thousand */ 
    number -= Hn * 1000; 
    var Dn = Math.floor(number / 100);       /* Tens (deca) */ 
    number = number % 100;               /* Ones */ 
    var tn= Math.floor(number / 10); 
    var one=Math.floor(number % 10); 
    var res = ""; 

    if (Gn>0) 
    { 
        res += (convert_number(Gn) + " MILLION"); 
    } 
    if (kn>0) 
    { 
            res += (((res=="") ? "" : " ") + 
            convert_number(kn) + " HUNDRED THOUSAND"); 
    } 
    if (Hn>0) 
    { 
        res += (((res=="") ? "" : " ") +
            convert_number(Hn) + " THOUSAND"); 
    } 

    if (Dn) 
    { 
        res += (((res=="") ? "" : " ") + 
            convert_number(Dn) + " HUNDRED"); 
    } 


    var ones = Array("", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX","SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN","FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN","NINETEEN"); 
var tens = Array("", "", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY","SEVENTY", "EIGHTY", "NINETY"); 

    if (tn>0 || one>0) 
    { 
        if (!(res=="")) 
        { 
            res += " AND "; 
        } 
        if (tn < 2) 
        { 
            res += ones[tn * 10 + one]; 
        } 
        else 
        { 

            res += tens[tn];
            if (one>0) 
            { 
                res += ("  " + ones[one]); 
            } 
        } 
    }

    if (res=="")
    { 
        res = "zero"; 
    } 
    return res;
}


$(function(){
	$("#speakCron").on('click',function(){
		speakCron();
	});
});