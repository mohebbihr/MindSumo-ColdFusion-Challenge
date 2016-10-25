<cfparam name="form.wrkid" default="" />
<cfparam name="form.wrktitle" default="" />
<cfparam name="form.wrkstartdate" default="" />
<cfparam name="form.wrkendDate" default="" />
<cfparam name="form.wrkdetails" default="" />

<cfset errorBean = createObject('cfday14.admin.cfc.errorBean').init() />

<cfset idArray=ArrayNew(1)>
<cfset titleArray=ArrayNew(1)>
<cfset stDateArray=ArrayNew(1)>
<cfset enDateArray=ArrayNew(1)>
<cfset detailArray=ArrayNew(1)>

<cfscript>
  idArray = ListToArray(form.wrkid);
  titleArray = ListToArray(form.wrktitle);
  stDateArray = ListToArray(form.wrkstartdate);
  enDateArray = ListToArray(form.wrkendDate);  
  detailArray = ListToArray(form.wrkdetails);
  
  for(i=1; i LTE ArrayLen(titleArray); i=i+1)
  {
    titleArray[i] = ReplaceNoCase(titleArray[i],"~",",","all");
  } 
  
  for(i=1; i LTE ArrayLen(detailArray); i=i+1)
  {
    detailArray[i] = ReplaceNoCase(detailArray[i],"~",",","all");
  }
</cfscript>

<cfloop from="1" to="#arrayLen( titleArray )#" index="i" >
	<!--- check if data is valid--->
		
	<cfif !len(trim(titleArray[i]))>
		<cfset errorBean.addError('Your title is required','title') />
	</cfif>	
	
	<cfif !len(trim(stDateArray[i]))>
		<cfset errorBean.addError('A start date is required','startDate') />
	</cfif>	
	
	<cfif !len(trim(detailArray[i]))>
		<cfset errorBean.addError('You need to provide some details','details') />
	</cfif>			
	
	<cfif !errorBean.hasErrors()>
		
	<cfif idArray[i] eq 0>
		<cfquery>
			INSERT INTO
				resume (
				title,
				startDate,
				endDate,
				details,
				type
			) VALUES (
				<cfqueryparam value="#trim(titleArray[i])#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#trim(stDateArray[i])#" cfsqltype="cf_sql_date" />,
				<cfqueryparam value="#trim(enDateArray[i])#" cfsqltype="cf_sql_date" />,
				<cfqueryparam value="#trim(detailArray[i])#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="workexperience" cfsqltype="cf_sql_varchar" />
			)
		</cfquery>
	
	<cfelseif  i le arrayLen( titleArray )>
		<cfquery>
			UPDATE
				resume
			SET
				title = <cfqueryparam value="#trim(titleArray[i])#" cfsqltype="cf_sql_varchar" />,
				startDate = <cfqueryparam value="#trim(stDateArray[i])#" cfsqltype="cf_sql_date" />,
				endDate = <cfqueryparam value="#trim(enDateArray[i])#" cfsqltype="cf_sql_date" />,
				details = <cfqueryparam value="#trim(detailArray[i])#" cfsqltype="cf_sql_varchar" />
			WHERE
				id = <cfqueryparam value="#idArray[i]#" cfsqltype="cf_sql_integer" />	
		</cfquery>
	</cfif>
	</cfif>
</cfloop>

	

