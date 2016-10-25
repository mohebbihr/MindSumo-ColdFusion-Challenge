<cfparam name="attributes.section" default="" />
<cfparam name="url.message" default="" />
<cfif thisTag.executionMode eq "start">
<cfset adminPath = createObject('cfday14.admin.cfc.system').getBasePath(cgi.script_name)/>
<cfoutput>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>#attributes.section#: My Personal Website</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/datepicker.css" rel="stylesheet">
      
     
    <!-- CSS Files -->
    <link media="all" rel="stylesheet" type="text/css" href="assets/css/all.css" />
	<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="assets/css/ie.css" /><![endif]-->
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css" />
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    
	<!-- include jQuery library -->
    <script type="text/javascript" src="assets/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.main.js"></script>
      
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    
  </head>

  <body>

       <!-- Start of left side panel -->
    	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<table  >
					<tr>						
						<td><span id="Start1_page_Label1"><b><font size="4"><a class="brand" href="index.cfm">Administration Panel</a></font></b></span></td>						
					</tr>					
				</table>
								
			</div>
			<div class="c1">
				<div class="controls" style="padding-top:3px;">
					<div class="profile-box">
						<span class="profile">
							<a href="##" class="section">								
								<span class="text-box">
									Welcome
									<strong class="name">
                                    <cfif structKeyExists(session,'emailaddress') && len(session.emailaddress)> <a href="logout.cfm" class="navbar-link">#session.emailAddress#</a></cfif>
                                    </strong>
								</span>
							</a>
							<a href="##" class="opener">opener</a>
						</span>
						<a href="?logoff" class="btn-on">On</a>
					</div>
				</div>														
				
				<div class="tabs">
                    
					<div id="dashtab" class="tab">
						<article>
							<div class="text-section">
								<h1>Home</h1>
								<p>You can manage the website here, for example you can build resume, portfolio and etc....</p>
                                
							</div>
							
						</article>
					</div>
					
					<div id="blogtab" class="tab">
						<article>
							<div class="text-section" >
								
								<h1>Blog Builder</h1>								
								<IFRAME id="frame1" src="content/blog/blogbuilder.cfm" frameBorder="0" scrolling="auto" width="750px" height="550px"  style="resizable=1,scrollbars=1">									
								</IFRAME>								
							</div>
							
							<div style="padding:50px;"></div>
						</article>
					</div>
					
					<div id="portfoliotab" class="tab">
						<article>
							<div class="text-section" >
								<h1>Portfolio Builder</h1>								
								<IFRAME id="frame1" src="content/portfolio/listportfolio.cfm" frameBorder="0" scrolling="auto" width="750px" height="350px"  style="resizable=1,scrollbars=1">									
								</IFRAME>								
							</div>
							<div style="padding:50px;"></div>
						</article>
					</div>				
					
				
					<div id="resumetab" class="tab">
						<article>
							<div class="text-section" >
								<h1>Resume Builder</h1>								
								<IFRAME id="frame1" src="content/resume/resumebuilder.cfm" frameBorder="0" scrolling="auto" width="800px" height="650px"  style="resizable=1,scrollbars=1">									
								</IFRAME>								
							</div>
							<div style="padding:50px;"></div>
						</article>
					</div>                  
                    
				</div>
			</div>
		</div>
		<aside id="sidebar" style="padding-top:4cm;">			
			<ul class="tabset buttons">
				<li class="active">
					<a href="##dashtab" class="ico1"><span>Dashboard</span><em></em></a>
					<span class="tooltip"><span>Dashboard</span></span>
				</li>				
				<li>
					<a href="##blogtab" class="ico3"><span>Blog Builder</span><em></em></a>
					<span class="tooltip"><span>Blog Builder</span></span>
				</li>
				<li>
					<a href="##portfoliotab" class="ico2"><span>Portfolio Builder</span><em></em></a>
					<span class="tooltip"><span>Portfolio Builder</span></span>
				</li>
				<li>
					<a href="##resumetab" class="ico4"><span>Resume Builder</span><em></em></a>
					<span class="tooltip"><span>Resume Builder</span></span>
				</li>								
			</ul>
			<span class="shadow"></span>
		</aside>
	</div>
    
    <!-- End of left side panel -->
      

    <div class="container-fluid">
      <div class="row-fluid">
      	<cfif len(trim(url.message))>
		  	<div class="alert alert-success">
		  		#url.message#
		  	</div>
		</cfif>	
</cfoutput>	      	
<cfelse>
		</div><!--/row-->


    </div><!--/.fluid-container-->
	
  </body>
</html>

</cfif>	