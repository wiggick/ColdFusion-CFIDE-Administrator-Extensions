function createIncrementSelect(selectBox,prefix,incStart,incEnd){

	var $select = $('#' + selectBox);
 
 // var s = $("<select id=\"selectId\" name=\"selectName\" />");
  for(var x = incStart;x<=incEnd;x++) {
  		val = prefix + x.toString();
      $("<option />", {value: val, text: val}).appendTo($select);
  }
	  
}

function clearCron(target){	
	$(target).children('.ui-selected').removeClass('ui-selected');	
}

function resetCron(){	
	var cronFields =['#minutesVal','#hoursVal','#monthsVal'];
	$('.ui-selected').removeClass('ui-selected');

	$("#monthdaysVal").val("*");
	$("#dowVal").val("?");	

	cronFields.forEach(function(item){
  		$(item).val("*");
	});
	assembleCron();
}

 

function cronValue($selected,cronLength,incSelectID,targetFieldID, txtObj){
    var rangeInited = false;
    var idxSelected;
    var idxTextSelected ='';
    var rangeStart;
    var rangeTextStart = '';
    var rangeEnd
    var rangeTextEnd = '';
    var stResult = ""; 
   
    
    if ($selected.length == cronLength || $selected.length == 0){
          $(targetFieldID).val("*");
          assembleCron();
          return;
        } 
        
     if ($selected.length == 1){
     	  
		  if(incSelectID == undefined){
			incVal = "";  
		  }else if(incSelectID.length > 0){
          	var incVal = $( incSelectID + " option:selected" ).val();
          }else{
          	incVal = "";
          }
     		
          if(incVal.length > 0){
          	 $(targetFieldID).val($selected.first().text() + incVal);
          }else{
          	 $(targetFieldID).val($selected.first().text());
          }
          	assembleCron();
             return;
        }  
    
    $selected.each(
    	function(index){   
      
      if (txtObj == undefined){
      	  idxSelected = parseInt($(this).text());
       }else{
       		idxSelected = txtObj[$(this).text()];
          idxTextSelected = $(this).text();
       }
     
        if(rangeInited == false){
        	rangeStart = idxSelected;
          rangeEnd = idxSelected;
          rangeTextStart = idxTextSelected;
          rangeTextEnd = idxTextSelected;
          rangeInited = true;
          
        }else{
        		if(idxSelected - 1 == rangeEnd){
            	 rangeEnd = idxSelected;
               rangeTextEnd = idxTextSelected;
               
            }else{
            	 if(stResult != ""){
               		stResult += ",";
               }
               if(txtObj == undefined){
               		stResult += rangeStart.toString();
                }else{
                	 stResult += rangeTextStart;
                }
               if(rangeStart != rangeEnd){
               		if(txtObj == undefined){
               			stResult += "-" + rangeEnd.toString();
                   }else{
                   		stResult += "-" + rangeTextEnd;
                   }
               }
               rangeStart = idxSelected;
               rangeTextStart = idxTextSelected;
               rangeEnd = idxSelected;
               rangeTextEnd = idxTextSelected;
            }
        }         
      }       
    );
    
      if(stResult != ""){
      	stResult += ",";
      }
      if(txtObj == undefined){
        stResult += rangeStart.toString();
       }else{
       	stResult += rangeTextStart;
       }
       
      if(rangeStart != rangeEnd){
      	if(txtObj == undefined){
       stResult += "-" + rangeEnd.toString();
       }else{
       	stResult += "-" + rangeTextEnd;
       }
        
      }
 		
		$(targetFieldID).val(stResult);
    assembleCron();
}

function assembleCron(){


  var cronFields =['#minutesVal','#hoursVal','#monthdaysVal','#monthsVal','#dowVal'];
  var cronTxt = "0";
  cronFields.forEach(function(item){
  		var cronVal =  $(item).val();
    
      if(cronVal.length == 0){
      		cronVal = "*";
      }
     cronTxt += ' ' + cronVal;
  });
   $('#cron').val(cronTxt);
   $('#cron').trigger('autogrow');
}


$(function(){

	
	createIncrementSelect("mininc"   ,'/',1,59);
    createIncrementSelect("hourinc"  ,'/',1,23);
    createIncrementSelect("dominc"   ,'/',1,30);
    createIncrementSelect("monthinc" ,'/',1,11);
    createIncrementSelect("dowinc"   ,'/',1,6);
    createIncrementSelect("domoffset",'L-',1,30);

    $('#cron').autoGrowInput({ minWidth: 100, maxWidth: 1000, comfortZone: 20 });
	
	$('#minutes').selectable();

	$('#minutes').on('selectablestop', function() { 
	    var $selected = $(this).children('.ui-selected');
	   
	    if ($selected.length > 1 && $( "#mininc option:selected" ).text() != 0){
	    	
	    	alert('only one value can be selected when using increments');
	    	clearCron('#minutes');
	    	var $selected = $(this).children('.ui-selected');
	    }
	   
	    
	     cronValue($selected,60,"#mininc",'#minutesVal');  
	});

	$('#daysofweek').selectable();

	$('#daysofweek').on('selectablestop', function() {
	    var $selected = $('#daysofweek').children('.ui-selected');
		 var days = {SUN:0,MON:1,TUE:2,WED:3,THU:4,FRI:5,SAT:6};
		 
		 console.log($selected.length);

		 if(($selected.length) > 0){
		 	$("#monthdaysVal").val("?");
		 	$("#daysofmonth").children('.ui-selected').removeClass('ui-selected');	
		 }else{
		 	$("#dowVal").val("?");
		 	if($("#monthdaysVal").val() == "?"){
		 		$("#monthdaysVal").val("*");
		 	}
		 	assembleCron();
		 	return;
		 }
		 
		  if( $('#optDOWstd').prop('checked') == true){
			 cronValue($selected,7,null,'#dowVal',days); 
		}
		 
		if( $('#optDOWinc').prop('checked') == true){
			if($selected.length > 1){	
				alert("only 1 weekday may be selected when using an increment");
				clearCron('#daysofweek');
				var $selected = $('#daysofweek').children('.ui-selected');
				 cronValue($selected,7,'#dowinc','#dowVal',days);
			}else{
				
				 cronValue($selected,7,'#dowinc','#dowVal',days);
			}
		}
		
		if( $('#optDOWocc').prop('checked') == true){
			if($selected.length > 1){	
				alert("only 1 weekday may be selected when using an occurence");
				clearCron('#daysofweek');
				var $selected = $('#daysofweek').children('.ui-selected');
				 cronValue($selected,7,'#dowocc','#dowVal',days);
			}else{	
				 cronValue($selected,7,'#dowocc','#dowVal',days);			 
			}
		}
	
	    
	    assembleCron();
	    
			 
	 
	});

	$('#hours').selectable();

	$('#hours').on('selectablestop', function() {
	    var $selected = $(this).children('.ui-selected');
	    

	    if ($selected.length > 1 && $( "#hourinc option:selected" ).text() != 0){
	    	
	    	alert('only one value can be selected when using increments');
	    	clearCron('#hours');
	    	var $selected = $(this).children('.ui-selected');
	    }
	    
	     cronValue($selected,24,"#hourinc",'#hoursVal'); 
	});

	$('#daysofmonth').selectable();

	$('#daysofmonth').on('selectablestop', function() {
	    var $selected = $(this).children('.ui-selected');
		///////////////////////////////
		 if(($selected.length) > 0){
		 	$("#dowVal").val("?");
		 	$("#daysofweek").children('.ui-selected').removeClass('ui-selected');	
		 }else{
		 	//days of week is the default ?
		 	$("#monthdaysVal").val("*");
		 	$("#dowVal").val("?");
		 	clearCron('#daysofweek');
		 	assembleCron();
		 	return;
		 }
		
		if( $('#optdomstd').prop('checked') == true){
			 cronValue($selected,31,null,'#monthdaysVal'); 
		}
		
		 
		if( $('#optdominc').prop('checked') == true){	
			if($selected.length > 1){
				alert('only one value can be selected when using increments');
				clearCron('#daysofmonth');
				var $selected = $(this).children('.ui-selected');		
			}
			cronValue($selected,31,"#dominc",'#monthdaysVal'); 
		}
		
	   	
		 if ( $selected.length > 0 && $('#optdomoff').prop('checked') == true){
	    	clearCron('#daysofmonth');
	    	alert('When using the L option, no days may be selected');
			return;
	    }
 		assembleCron();
	   
	});

	$('#months').selectable();


	$('#months').on('selectablestop', function() {
		 
	    var $selected = $(this).children('.ui-selected');
	    if ($selected.length > 1 && $( "#monthinc option:selected" ).text() != 0){
	    	
	    	alert('only one value can be selected when using increments');
	    	clearCron('#months');
	    	var $selected = $(this).children('.ui-selected');
	    }
	     cronValue($selected,12,"#monthinc",'#monthsVal');
	});
	
	$('#mininc').on('change', function(){
		clearCron('#minutes');
		var $selected = $('#minutes').children('.ui-selected');
		 cronValue($selected,60,"#mininc",'#minutesVal');  
	});	
	
	$('#hourinc').on('change', function(){
		//clearCron('#hours');
		var $selected = $('#hours').children('.ui-selected');
		if ($selected.length > 1 ){
			$('#hoursVal').val("*");
			clearCron('#hour');
		
		}else if ($selected.length == 1){
			 cronValue($selected,11,"#hourinc",'#hoursVal'); 
		}else{
			$('#monthsVal').val("*");
		}
		
		assembleCron();
		
			
		 cronValue($selected,60,"#hourinc",'#hoursVal');  
	});	
	
	$('#monthinc').on('change', function(){
		
		var $selected = $('#months').children('.ui-selected');
			
		if ($selected.length > 1 ){
			$('#monthsVal').val("*");
			clearCron('#months');
		
		}else if ($selected.length == 1){
			 cronValue($selected,11,"#monthinc",'#monthsVal'); 
		}else{
			$('#monthsVal').val("*");
		}
		
		assembleCron();
		
		
		
		 
	});	
	
	
	//Days of the month routines
	
	$('input[name=optMonth]').on('change', function(){
		
		var $selected = $('#daysofmonth').children('.ui-selected');
		
		if( $('#optdomstd').prop('checked') == true){
			cronValue($selected,30,null,'#monthdaysVal');
			
		}
		//Increment
		if( $('#optdominc').prop('checked') == true){
			 if ($selected.length == 1){			 
			 	cronValue($selected,30,"#dominc",'#monthdaysVal');
			 }else{
			 	$('#dominc').val('');
			 	$('#monthdaysVal').val("*");	
			 	clearCron('#daysofmonth');
			 }
		}
		//L Option
		if( $('#optdomoff').prop('checked') == true){
			 clearCron('#daysofmonth');
			 $('#monthdaysVal').val($("#domoffset option:selected" ).text());			
		}
	
		assembleCron();		
	});
	
	$('#dominc').on('change',function(){
	   
		if( $("#dominc option:selected" ).text().length !== 1){
			$('#optdominc').prop('checked',true);
			$('#domoffset').val('');	
			
			var $selected = $('#daysofmonth').children('.ui-selected');
			
	    	if ($selected.length > 1 || $('#monthdaysVal').val().substr(0,1) == 'L' ){
				$('#monthdaysVal').val("*");
				clearCron('#daysofmonth');
				
			}else{
				 cronValue($selected,31,"#dominc",'#monthdaysVal');
			}
			assembleCron();
		}		
	});
	
	$('#domoffset').on('change',function(){
		 clearCron('#daysofmonth');
		 $('#dominc').val('');
		 $('#optdomoff').prop('checked',true);
		 
		if( $("#domoffset option:selected" ).text().length != 0){
			 $('#monthdaysVal').val($("#domoffset option:selected" ).text());
		}else{
			 $('#monthdaysVal').val("L");
		}
			
		assembleCron();	
			
	});
	
	$('input[name=optDOW]').on('change', function(){
		
		
		var $selected = $('#daysofweek').children('.ui-selected');
		 var days = {SUN:0,MON:1,TUE:2,WED:3,THU:4,FRI:5,SAT:6};
		 
		 if( $('#optDOWstd').prop('checked') == true){
			 cronValue($selected,7,null,'#dowVal',days); 
		}
		
		if( $('#optDOWocc').prop('checked') == true){
			if($selected.length > 1){	
				alert("only 1 weekday may be selected when using an occurence");
				clearCron('#daysofweek');
				var $selected = $('#daysofweek').children('.ui-selected');
				 cronValue($selected,7,'#dowocc','#dowVal',days);
			}else{
				
				 cronValue($selected,7,'#dowocc','#dowVal',days);
			}
		}
		
		if( $('#optDOWinc').prop('checked') == true){
			 if($selected.length > 1){	
				alert("only 1 weekday may be selected when using an increment");
				clearCron('#daysofweek');
				var $selected = $('#daysofweek').children('.ui-selected');
				 cronValue($selected,7,'#dowinc','#dowVal',days);
			}else{
				
				 cronValue($selected,7,'#dowinc','#dowVal',days);
			}  
		}
	    	
		assembleCron();		
	});
	
	
	$('#dowinc').on('change',function(){
		 var $selected = $('#daysofweek').children('.ui-selected');
		 var days = {SUN:0,MON:1,TUE:2,WED:3,THU:4,FRI:5,SAT:6};
		
		if( $('#optDOWinc').prop('checked') == true){
			if($selected.length > 1){	
				alert("only 1 weekday may be selected when using an increment");
				clearCron('#daysofweek');
				var $selected = $('#daysofweek').children('.ui-selected');
				 cronValue($selected,7,'#dowinc','#dowVal',days);
			}else{
				
				 cronValue($selected,7,'#dowinc','#dowVal',days);
			}
		}
	   
	});
	
	$('#dowocc').on('change',function(){
		 var $selected = $('#daysofweek').children('.ui-selected');
		 var days = {SUN:0,MON:1,TUE:2,WED:3,THU:4,FRI:5,SAT:6};
		
		if( $('#optDOWocc').prop('checked') == true){
			if($selected.length > 1){	
				alert("only 1 weekday may be selected when using an occurence");
				clearCron('#daysofweek');
				var $selected = $('#daysofweek').children('.ui-selected');
				 cronValue($selected,7,'#dowocc','#dowVal',days);
			}else{
				
				 cronValue($selected,7,'#dowocc','#dowVal',days);
			}
		}
	   
	});
	
	
});