<cfimport taglib="../../portfoliocustomtags" prefix="ct" />
<ct:securityCheck redirectPage="#cgi.script_name#"/>

<cfset adminPath = createObject('cfday14.admin.cfc.system').getBasePath(cgi.script_name) />

<cfquery name="qPortfolio">
	SELECT
		id,
		title,
		website
	FROM
		portfolio
	ORDER BY
		title
</cfquery>

<ct:layout section="portfolio">
	<div class="span10">
		<h2>Portfolio List</h2>
		    
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Title</th>
					<th>Website</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<cfoutput query="qPortfolio">
					<tr>
						<td>
							#qPortfolio.title#
						</td>
						<td>
							#qPortfolio.website#
						</td>
						<td>
							<a href="#adminPath#/portfolio/editportfolio.cfm?id=#qPortfolio.id#"><i class="icon-edit"></i>Actions</a>
						</td>
					</tr>
				</cfoutput>
			</tbody>
	    </table>
	    
	    <p>
	    	<form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="<cfoutput>#adminPath#</cfoutput>/portfolio/editportfolio.cfm">
					<i class="icon-plus icon-white"></i> 
					New Portfolio
				</a>
		    </form>
	    </p>
	</div>	
</ct:layout>	
