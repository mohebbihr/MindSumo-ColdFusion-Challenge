<cfimport taglib="../../blogcustomtags" prefix="ct" />
<ct:securityCheck redirectPage="#cgi.script_name#"/>

<cfparam name="url.id" default="0" />
<cfparam name="form.submitted" default="0" />
<cfparam name="form.id" default="0" />
<cfparam name="form.name" default="" />

<cfset errorBean = createObject('cfday14.admin.cfc.errorBean').init() />
<cfset blogPosts = EntityLoad('BlogPost') />
<cfset categories = entityLoad('BlogCategory' ) />



<cfoutput >
	<ct:layout>
	
  <label id="msgbox" style="color:green;"></label>
  <div id="page-wrap">
  	<div id="tabs">
		
		<ul>
    		<li><a href="##fragment-1">Blogs Info</a></li>    		   	
    		<li><a href="##fragment-2">Blogs Category Info</a></li>
	   </ul>
  	
  	<div id="fragment-1" class="ui-tabs-panel">
		<form id="blogform" >
	    <h2 class="fs-title">List of Blog Posts</h2> 
	    <div id="bloglist" class="controls">
	    	
	    	<cfloop array="#blogPosts#" index="blogPost">
	    		<input id="blogid" name="blogid" type="hidden" value="#blogPost.id#" />	    	            
                <label for="title">Title</label> 
			    <input type="text" id="blogtitle" name="blogtitle" value="#blogPost.title#" />
			    <a onclick="toggleDiv(#blogPost.id#)" href="##" class="btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;">Show/Hide</a>
			    <div id="toggle#blogPost.id#" class="toggle">			    				   
				    <label class="control-label" for="title">Summary</label>
				    <textarea rows="6" id="blogsummary" name="blogsummary" style="width:90%; height:5%;" >#blogPost.summary#</textarea>
				    </br>
				    <label class="control-label" for="title">Body</label>
				    </br>					
					<textarea rows="3" id="blogbody" name="blogbody" style="width:90%; height:25%;" class="input-xlarge">#blogPost.body#</textarea>
					</br>
					<label class="control-label" for="details">Publish Date</label>				
					<input type="text" id="blogdatePosted" name="blogdatePosted" class="input-medium popupDatepicker" style="width:15%;" value="#dateFormat(blogPost.datePosted,'mm/dd/yyyy')#" />								
				    </br>
				    <label class="control-label" for="details">Categories</label>
											
					<cfloop array="#categories#" index="category">
						<input type="checkbox" name="Categories" value="#category.id#" <cfif listfind(blogPost.categoryids,category.id)>checked</cfif>>#category.name#<br />
					</cfloop>					
					
				</div>						
			</cfloop>
					
	    		    		    	
            <div class="list-item" id="addblglist">
            	<input id="blogid" name="blogid" type="hidden" value="0" />	    	            
                <label for="title">Title</label> 
			    <input type="text" id="blogtitle" name="blogtitle"   />
			    </br>
			    <label class="control-label list-remove" for="title" >Summary</label>
			    <textarea rows="6" id="blogsummary" name="blogsummary" style="width:90%; height:5%;" class=" input-xlarge"></textarea>
			    </br>
			    <label class="control-label list-remove" for="title" >Body</label>					
				</br>
				<textarea rows="3" id="blogbody" name="blogbody" style="width:90%; height:25%;" ></textarea>
				</br>
				<label class="control-label " for="details" >Publish Date</label>				
				<input type="text" id="blogdatePosted" name="blogdatePosted" class="input-medium popupDatepicker" style="width:15%;" />				
			    </br>
			    <label class="control-label " for="details" >Categories</label>
				<div class="controls " >						
					<cfloop array="#categories#" index="category">
						<input type="checkbox" name="Categories" value="#category.id#" >#category.name#<br />
					</cfloop>					
				</div>
            	
                <a href="##" class="list-remove btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-minus"></i> Remove Post</a>
            </div>
            <div onclick="$('##addblglist:last').show(); $('##addblglist:last').children('a').show();">
            <a href="##" class="list-add btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-plus"></i> Add Post</a>
            </div>
        </div>
        <input type="submit" class="btn btn-primary btn-large" value="Save"/> 
        </br>
	    </br>      	    	    	    				
		</form>
	</div>
    
    <div id="fragment-2" class="ui-tabs-panel">
		<form id="catform" >
	    <h2 class="fs-title">Blog Category Info</h2> 
	    <div id="catlist" class="controls">
	    	
	    	<cfcache action="cache" timespan="#createtimespan(0,1,0,0)#">
				<cfset blogCategories = Entityload('BlogCategory') />
				<cfloop array="#blogCategories#" index="blogCategory">
					<input id="catid" name="catid" type="hidden" value="#blogCategory.id#" />	    	            
	                <label for="title">Name</label> 
				    <input type="text" id="catname" name="catname" value="#blogCategory.name#" >										
				</cfloop>					
			</cfcache>											    							    		    	
	    	
            <div class="list-item" id="blgcatlist">
            	<input id="catid" name="catid" type="hidden" value="0" />	    	            
                <label for="title"  >Name</label> 
			    <input type="text"  id="catname" name="catname" placeholder="New Blog Category">            	
                <a href="##" class="list-remove btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-minus"></i> Remove Category</a>
            </div>
            <div onclick="$('##blgcatlist:last').show(); $('##blgcatlist:last').children('a').show();">
            <a href="##" class="list-add btn btn-small" style="padding:3px 9px;font-size:12px;line-height:18px;background: ##b99b88;color: ##FFF;"><i class="icon-plus"></i> Add Category</a>
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

