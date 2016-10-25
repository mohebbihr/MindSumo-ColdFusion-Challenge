<cfparam name="form.blogid" default="" />
<cfparam name="form.blogtitle" default="" />
<cfparam name="form.blogsummary" default="" />
<cfparam name="form.blogbody" default="" />
<cfparam name="form.blogdatePosted" default="" />
<cfparam name="form.categories" default="" />

<cfset errorBean = createObject('cfday14.admin.cfc.errorBean').init() />

<cfset idArray=ArrayNew(1)>
<cfset titleArray=ArrayNew(1)>
<cfset summaryArray=ArrayNew(1)>
<cfset bodyArray=ArrayNew(1)>
<cfset detepostArray=ArrayNew(1)>
<cfset catArray=ArrayNew(1)>

<cfscript>
  idArray = ListToArray(form.blogid);
  titleArray = ListToArray(form.blogtitle);
  summaryArray = ListToArray(form.blogsummary);
  bodyArray = ListToArray(form.blogbody);
  detepostArray = ListToArray(form.blogdatePosted);
  catArray = ListToArray(form.categories);
  
  for(i=1; i LTE ArrayLen(titleArray); i=i+1)
  {
    titleArray[i] = ReplaceNoCase(titleArray[i],"~",",","all");
  } 
  
  for(i=1; i LTE ArrayLen(summaryArray); i=i+1)
  {
    summaryArray[i] = ReplaceNoCase(summaryArray[i],"~",",","all");
  }
  
  for(i=1; i LTE ArrayLen(bodyArray); i=i+1)
  {
    bodyArray[i] = ReplaceNoCase(bodyArray[i],"~",",","all");
  }
  
</cfscript>

<cfloop from="1" to="#arrayLen( titleArray )#" index="i" >
	<!--- check if data is valid--->
		
	<cfif !len(trim(titleArray[i]))>
		<cfset errorBean.addError('Title is required','title') />
	</cfif>	
	
	<cfif !len(trim(summaryArray[i]))>
		<cfset errorBean.addError('A summary is required','startDate') />
	</cfif>	
	
	<cfif !len(trim(bodyArray[i]))>
		<cfset errorBean.addError('You need to provide a body','details') />
	</cfif>	
	
	<cfif !len(trim(detepostArray[i]))>
		<cfset errorBean.addError('You need to provide a release date','details') />
	</cfif>			
	
	<!--- Only process if there are no errors --->
	<cfif !errorBean.hasErrors()>
		
	<cfif idArray[i] eq 0 and i le arrayLen( titleArray )>
		<!--- New Entity --->
		<cfset blogPost = EntityNew('BlogPost') />
		<cfset blogPost.title = titleArray[i] />
		<cfset blogPost.summary = summaryArray[i] />
		<cfset blogPost.body = bodyArray[i] />
		<cfset blogPost.datePosted = detepostArray[i] />
		<cfset blogPost.createdDateTime = now() />
			
			
	<cfelseif i le arrayLen( titleArray )>
		<!--- Update Entity --->
		<cfset blogPost = EntityLoad('BlogPost',idArray[i],true) />
		<cfset blogPost.title = titleArray[i] />
		<cfset blogPost.summary = summaryArray[i] />
		<cfset blogPost.body = bodyArray[i] />
		<cfset blogPost.datePosted = detepostArray[i] />
		<cfset blogPost.modifiedDateTime = now() />
		
		<cfloop array="#blogPost.getCategories()#" index="category">
			<cfset entityDelete(category) />
		</cfloop>
			
	</cfif>
	<cfset entitySave(blogPost) />
		
	<cfloop list="#form.categories#" index="categoryID">
		<!--- Add Category to Entity --->
		<cfset blogPostCategory = EntityNew('BlogPostCategory') />
		<cfset blogCategory = Entityload('BlogCategory',categoryID,true) />
		<cfset blogPostCategory.blogCategory = blogCategory />
		<cfset blogPostCategory.blogPost = blogPost /> 
		<cfset entitySave(blogPostCategory) />
	</cfloop>
	
	<cfset ormFlush() />
	</cfif>	
</cfloop>

	
