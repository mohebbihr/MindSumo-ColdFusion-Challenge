<cfimport taglib="../../resumecustomtags" prefix="ct" />
<ct:securityCheck redirectPage="#cgi.script_name#"/>

<cfparam name="url.id" default="0" />
<cfparam name="form.submitted" default="0" />
<cfparam name="form.id" default="0" />
<cfparam name="form.name" default="" />

<cfset errorBean = createObject('cfday14.admin.cfc.errorBean').init() />

<cfquery name="qSkillsets">
	SELECT
		id,
		name
	FROM
		skillset
	ORDER BY
		name
</cfquery>

<cfquery name="qEducation">
	SELECT
		id,
		title,
		startDate,
		endDate,
		details
	FROM
		resume
	WHERE
		type = 'education'
</cfquery>
	
<cfquery name="qWorkExperience">
	SELECT
		id,
		title,
		startDate,
		endDate,
		details
	FROM
		resume
	WHERE
		type = 'workexperience'
</cfquery>


<cfoutput >
	<ct:layout>
	
  <label id="msgbox" style="color:green;"></label>
  <div id="page-wrap">
  	<div id="tabs">
		
		<ul>
    		<li><a href="##fragment-1">Education</a></li>
    		<li><a href="##fragment-2">Skills</a></li>
    		<li><a href="##fragment-3">Work Experience</a></li>    		
	   </ul>
  	
  	<div id="fragment-1" class="ui-tabs-panel">
		<form id="eduform" >
	    <h2 class="fs-title">Education Info</h2> 
	    <div id="edulist" class="controls">
	    	
	    	<cfloop query="qEducation">
				<input id="eduid" name="eduid" type="hidden" value="#qEducation.id#" />	    	            
                <label for="title">School *</label> 
			    <input type="text" id="schtitle" name="schtitle" value="#qEducation.title#" >
			    <label for="dates">Dates *</label>
			    <input type="text" id="schstartDate" name="schstartdate" value="#dateformat(qEducation.startDate,'mm/dd/yyyy')#" class="input-medium popupDatepicker" style="width:15%;" > to <input type="text" id="schendDate" name="schendDate" value="#dateformat(qEducation.endDate,'mm/dd/yyyy')#" class="input-medium popupDatepicker" style="width:15%;" >
			    </br><label for="details">Details  </label>
			    <textarea id="schdetails" name="schdetails" style="width:90%; height:15%;"  > #qEducation.details# </textarea>
			    </br>
			</cfloop>
	    	
            <div class="list-item " id="addedulist">
            	<input id="eduid" name="eduid" type="hidden" value="0" />
                <label for="title" >School *</label> 
			    <input type="text" id="schtitle" name="schtitle" class="list-remove" />
			    <label for="dates" >Dates *</label>
			    <input type="text" id="schstartDate" name="schstartdate" class="input-medium popupDatepicker" style="width:15%;" > 
			    <label> to   	
			    </label><input type="text" id="schendDate" name="schendDate" class="input-medium popupDatepicker" style="width:15%;" >
			    </br><label for="details" >Details  </label>
			    <textarea id="schdetails" name="schdetails" style="width:90%; height:15%;" ></textarea>
                <a href="##" class="list-remove btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-minus"></i> Remove Education</a>
            </div>
            <div onclick="$('##addedulist:last').show(); $('##addedulist:last').children('a').show();">
            <a href="##" class="list-add btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-plus"></i> Add Education</a>
            </div>
        </div>
        <input type="submit" class="btn btn-primary btn-large" value="Save"/> 
        </br>
	    </br>      	    	    	    				
		</form>
	</div>
        	
	 <div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
      	<form id="skillform" name="skillform" style="width:90%;">      	
	    <h2 class="fs-title">Skills</h2>   
	    <div class="control-group">        
	        <div id="skillslist" class="controls">
	       		        
			<cfloop query="qSkillsets">
				<input id="skillid" name="skillid" type="hidden" value="#qSkillsets.id#" />	    
	            <input name="skillname" id="skillname" type="text" value="#qSkillsets.name#" style="width:40%;">
			</cfloop>
        	
	            <div class="list-item" id="addskilllist">
	            	<input id="skillid" name="skillid" type="hidden" value="0" />	    
	                <input name="skillname" id="skillname" type="text" placeholder="New Skill"  style="width:40%;" >
	                <a href="##"  class="list-remove btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88; color: ##FFF;"><i class="icon-minus"></i> Remove</a>
	            </div>
	            <div onclick="$('##addskilllist:last').show(); $('##addskilllist:last').children('a').show();">	            	
	            
	            <a href="##" class="list-add btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-plus"></i> Add Skill</a>
	            </div>
	        </div>
	    </div>	
	    <input type="submit" class="btn btn-primary btn-large" value="Save"/>
	    </br>
	    </br>            	           
	    </form>      
    </div>
  		
  	<div id="fragment-3" class="ui-tabs-panel ui-tabs-hide">
    	<form id="workform" style="width:90%;">
	    <h2 class="fs-title">Work Experience</h2>
	    <div id="worklist" class="controls">
            
            <cfloop query="qWorkExperience">
				<input id="wrkid" name="wrkid" type="hidden" value="#qWorkExperience.id#" />	    	            
                <label for="title" >School *</label> 
			    <input type="text" id="wrktitle" name="wrktitle" value="#qWorkExperience.title#" />
			    <label for="dates" >Dates *</label>
			    <input type="text" id="wrkstartdate" name="wrkstartdate" value="#dateformat(qWorkExperience.startDate,'mm/dd/yyyy')#" class="input-medium popupDatepicker" style="width:15%;" > 
			    	to
			    	<input type="text" id="wrkendDate" name="wrkendDate" value="#dateformat(qWorkExperience.endDate,'mm/dd/yyyy')#" class="input-medium popupDatepicker" style="width:15%;" >
			    </br><label for="details" >Details  </label>
			    <textarea id="wrkdetails" name="wrkdetails" style="width:90%; height:15%;"  > #qWorkExperience.details# </textarea>
			    </br>
			</cfloop>
            
            <div class="list-item" id="addwrklist">
            	<input id="wrkid" name="wrkid" type="hidden" value="0" />
                <label for="title" >Position</label> 
			    <input type="text" id="wrktitle" name="wrktitle" />
			    <label for="dates" >Dates *</label>
			    <input type="text" id="wrkstartdate" name="wrkstartdate" class="input-medium popupDatepicker" style="width:15%;" > 
			    	<label > to </label>
			    	<input type="text" id="wrkendDate" name="wrkendDate" class="input-medium popupDatepicker" style="width:15%;" >
			    </br><label for="details" >Details</label>
			    <textarea id="wrkdetails" name="wrkdetails" style="width:90%; height:15%;" ></textarea>
                <a href="##" class="list-remove btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-minus"></i> Remove Work Experience</a>
            </div>
            <div onclick="$('##addwrklist:last').show(); $('##addwrklist:last').children('a').show();">
            <a href="##" class="list-add btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-plus"></i> Add Work Experience</a>
            </div>
        </div>	    	        	    
	    <input type="submit" class="btn btn-primary btn-large" value="Save"/>
	    </br>
	    </br>
	    </form>        
    </div>	              

    </div>
   </div>       				
		
	</ct:layout>

	
</cfoutput>

