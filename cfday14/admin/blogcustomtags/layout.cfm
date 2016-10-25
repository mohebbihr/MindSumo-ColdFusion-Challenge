<cfparam name="attributes.section" default="" />
<cfparam name="url.message" default="" />
<cfif thisTag.executionMode eq "start">
<cfset adminPath = createObject('cfday14.admin.cfc.system').getBasePath(cgi.script_name)/>
<cfoutput>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js"> <![endif]-->

<html lang="en">
  <head>
  	<cfajaximport>
  	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>#attributes.section#: My Personal Website</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="../../assets/css/tabs.css" type="text/css" media="screen, projection"/>
	<link href="../../assets/css/jquery.datepick.css" rel="stylesheet">	
    <style>.list-remove{display:none}</style>
        
	<script type="text/javascript" src="../../assets/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="../../assets/js/jquery-ui-1.7.custom.min.js"></script>
	<script src="../../assets/js/jquery.plugin.js"></script>
	<script src="../../assets/js/jquery.datepick.js"></script>
	<script src="../../assets/js/jquery.dynamiclist.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	function toggleDiv(divId) {
	   $("##toggle"+divId).toggle();	   
	}
	</script>
	
        <script>
            (function($) {
                $(document).ready(function() {
                	$("##blgcatlist:last").hide();
                	$("##addblglist:last").hide();                	
                	
                	$('[class=toggle]').each(function(){$(this).toggle();});
                	
                    $("##bloglist").dynamiclist();                    
                    $("##catlist").dynamiclist();
                    
                    // submit skillform data
                    $("##blogform").submit(function(event) {
                        event.preventDefault();                          
                        // find a replace , with ~ in all 
                        $('[id=blogsummary],[id=blogbody]').each(function(index, obj){
                        	str = $(this).val();						    
						    str = str.replace(new RegExp(',', 'g'), '~');
						    $(this).val(str);						    
						});                                             
                        // submit data to server
                        ColdFusion.Ajax.submitForm('blogform', 'serverscripts/blogscript.cfm', callback, errorHandler);                        
                        // show a message to user or refresh??
                                              
                    });
                    
                    // submit eduform data
                    $("##catform").submit(function(event) {
                        event.preventDefault(); 
                        // find a replace , with ~ in all 
                        $('[id=catname]').each(function(index, obj){
                        	str = $(this).val();						    
						    str = str.replace(new RegExp(',', 'g'), '~');
						    $(this).val(str);						    
						});                                              
                        // submit data to server
                        ColdFusion.Ajax.submitForm('catform', 'serverscripts/catscript.cfm', callback, errorHandler);                        
                                             
                    });                                        
                    
                    function callback(text) 
				    { 
				    	location.reload();				        
				    } 
				
				    function errorHandler(code, msg) 
				    { 
				        alert("Error!!! " + code + ": " + msg); 
				    } 
    
                });
            })(jQuery);
        </script>
        
    <script type="text/javascript">
    	
		$(function() {

			var $tabs = $('##tabs').tabs();
	
			$(".ui-tabs-panel").each(function(i){
	
			  var totalSize = $(".ui-tabs-panel").size() - 1;
	
			  if (i != totalSize) {
			      next = i + 2;
		   		  $(this).append("<a href='##' class='next-tab mover' rel='" + next + "'>Next Page &##187;</a>");
			  }
	  
			  if (i != 0) {
			      prev = i;
		   		  $(this).append("<a href='##' class='prev-tab mover' rel='" + prev + "'>&##171; Prev Page</a>");
			  }
   		
			});
	
			$('.next-tab, .prev-tab').click(function() { 
		           $tabs.tabs('select', $(this).attr("rel"));
		           return false;
		       });
       

		});
    </script>
     
	<script>
	$(function() {
		$('.popupDatepicker').datepick();		
	});

	</script>
  
  </head>

  <body>

       
</cfoutput>	      	
<cfelse>
		
	
  </body>
</html>

</cfif>	