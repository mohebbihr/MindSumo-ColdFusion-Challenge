<cfparam name="form.skillid" default="" />
<cfparam name="form.skillname" default="" />

<cfset errorBean = createObject('cfday14.admin.cfc.errorBean').init() />

<cfset idArray=ArrayNew(1)>
<cfset nameArray=ArrayNew(1)>
<cfscript>
	idArray = ListToArray(form.skillid);
	nameArray = ListToArray(form.skillname);
  
  for(i=1; i LTE ArrayLen(nameArray); i=i+1)
  {
    nameArray[i] = ReplaceNoCase(nameArray[i],"~",",","all");
  }
</cfscript>

<cfloop from="1" to="#arrayLen( idArray )#" index="i" >
	<!--- check if data is valid--->
		
	<cfif !len(trim(nameArray[i]))>
		<cfset errorBean.addError('Name is required','title') />
	</cfif>	
	
	
	<cfif !errorBean.hasErrors()>
	<cfif idArray[i] eq 0 and i le arrayLen( nameArray )>
		<cfquery>
			INSERT INTO
				skillset (
				name
			) VALUES (
				<cfqueryparam value="#trim(nameArray[i])#" cfsqltype="cf_sql_varchar" />
			)
		</cfquery>
	<cfelseif i le arrayLen( nameArray )>
		<cfquery>
			UPDATE
				skillset
			SET
				name = <cfqueryparam value="#trim(nameArray[i])#" cfsqltype="cf_sql_varchar" />
			WHERE
				id = <cfqueryparam value="#idArray[i]#" cfsqltype="cf_sql_integer" />	
		</cfquery>
	</cfif>
	</cfif>		
</cfloop>

	
