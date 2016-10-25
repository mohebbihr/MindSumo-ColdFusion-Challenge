<cfparam name="form.catid" default="" />
<cfparam name="form.catname" default="" />

<cfset errorBean = createObject('cfday14.admin.cfc.errorBean').init() />

<cfset idArray=ArrayNew(1)>
<cfset nameArray=ArrayNew(1)>
<cfscript>
	idArray = ListToArray(form.catid);
	nameArray = ListToArray(form.catname);
  
	for(i=1; i LTE ArrayLen(nameArray); i=i+1)
	{
		nameArray[i] = ReplaceNoCase(nameArray[i],"~",",","all");
	}
</cfscript>

<cfloop from="1" to="#arrayLen( idArray )#" index="i" >
	<!--- check if data is valid--->
		
	<cfif !len(trim(nameArray[i]))>
		<cfset errorBean.addError('Name is required','name') />
	</cfif>	
	
	<cfif !errorBean.hasErrors()>
	<cfif idArray[i] eq 0 and i le arrayLen( nameArray )>
		<!--- New Entity --->
		<cfset blogCat = EntityNew('BlogCategory') />
		<cfset blogCat.name = trim(nameArray[i]) />		
			
	<cfelseif i le arrayLen( nameArray )>
		<!--- Edit Entity --->
		<cfset blogCat = EntityLoad('BlogCategory',idArray[i],true) />
		<cfset blogCat.name = trim(nameArray[i]) />	
					
	</cfif>	
	<cfset entitySave(blogCat) />
	</cfif>
</cfloop>

<cfset ormFlush() />
	
