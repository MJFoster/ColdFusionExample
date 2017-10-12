<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>
			HD Street Concert Band - News
		</title>
		<link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen"/>
		<script type="text/javascript" src="/cfTraining/script/jquery.js">

		</script>
		<script type="text/javascript" src="/cfTraining/script/menu.js">

		</script>
	</head>
	
	<body>
		<div id="wrapper">
			<div id="header">
				<a href="#"><img src="/cfTraining/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
				<p id="mainTitle">
					<img src="/cfTraining/images/mainTitle.png" width="398" height="158" 
					     alt="HD Street Concert Band"/>
					<span>
						HD Street Concert Band
					</span>
				</p>
				<ul>
					<li>
						<a href="siteMap.html">
							Site Map
						</a>
					</li>
					<li>
						<a href="contactUs.html">
							Contact us
						</a>
					</li>
				</ul>
			</div>
			<div id="menu">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="agenda.html">Agenda</a></li>
					<li><a href="#">The Band</a>
						<ul>
							<li><a href="director.html">The director</a></li>
							<li><a href="history.html">The band History</a></li>
						</ul>
					</li>
					<li><a href="wePlayForYou.html">We play for You</a>
					</li>
					<li><a href="comePlayWithUs.html">Come play with us</a></li>
					<li><a href="news.html">News</a></li>
				</ul>
			</div>
			<div id="pageBody">
				<div id="calendarContent">
					<!---If the url passed by page request contain a 'newsID' variable, display a specific article 
					     whose newsID = newsID passed in. Otherwise, display ALL news.--->
					<cfif isDefined('url.newsID')>
						<!---Display specific news article along with author's first/last names--->
						<cfquery datasource="hdStreet-training" name="rsSingleNewsDetail">
							SELECT TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_NEWS.FLD_NEWSCONTENT,
									TBL_USERS.FLD_USERFIRSTNAME as userFN, 
									TBL_USERS.FLD_USERLASTNAME as userLN
							FROM TBL_NEWS
							INNER JOIN TBL_USERS ON TBL_NEWS.FLD_NEWSAUTHOR = TBL_USERS.FLD_USERID
							WHERE TBL_NEWS.FLD_NEWSID = #url.newsID#
						</cfquery>
						
						<cfoutput query="rsSingleNewsDetail">
							<h1>#FLD_NEWSTITLE#</h1>
							<p class="metadata">
								Published #dateFormat(FLD_NEWSCREATIONDATE,"mmm dd yyyy")# by #userFN# #userLN#
							</p>
							 <p>#FLD_NEWSCONTENT#</p>
						</cfoutput>
					<cfelseif isDefined('url.year')>	<!---Get ALL news for YEAR in http request --->
						<cfquery datasource="hdStreet-training" name="rsNewsOfYear">
							SELECT 	FLD_NEWSTITLE,
									FLD_NEWSID,
									FLD_NEWSCREATIONDATE,
									FLD_NEWSCONTENT
							FROM TBL_NEWS
							WHERE year(FLD_NEWSCREATIONDATE) = #url.year#
							ORDER BY FLD_NEWSCREATIONDATE DESC
						</cfquery>
						<h1>All The News In <cfoutput>#url.year#</cfoutput></h1>
						<cfoutput query="rsNewsOfYear">
							<table>
								<tr>
									<td>
										#dateFormat(rsNewsOfYear.FLD_NEWSCREATIONDATE,"mmm dd yyyy")#
									</td>
									<td>
										#rsNewsOfYear.FLD_NEWSTITLE#
									</td>
									<td>
										<!---Dynamically query the response of THIS query, and assign one
											of its properties to a new variable 'newsID'--->
										<a href="news.cfm?newsID=#FLD_NEWSID#">
											Read More
										</a>
									</td>
								</tr>
							</table>
						</cfoutput>
					<cfelse>		<!---Get ALL news by querying the DSN and saving results in a variable --->
						<cfquery datasource="hdStreet-training" name="rsAllNews">
							SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
							FROM TBL_NEWS
							ORDER BY FLD_NEWSCREATIONDATE DESC
						</cfquery>
							
						<h1>
							News
						</h1>
						<table>
							<cfoutput query="rsAllNews">
								<tr>
									<td>
										#dateFormat(rsAllNews.FLD_NEWSCREATIONDATE,"mmm dd yyyy")#
									</td>
									<td>
										#rsAllNews.FLD_NEWSTITLE#
									</td>
									<td>
										<!---Dynamically query the response of THIS query, and assign one
											of its properties to a new variable 'newsID'--->
										<a href="news.cfm?newsID=#FLD_NEWSID#">
											Read More
										</a>
									</td>
								</tr>
							</cfoutput>
						</table>
					</cfif>
				</div>

				
				<div id="calendarSideBar">
					<!---Query the database again for the sidebar, but return only the 'YEARS' of each record to be used to 
					populate the <li> links.  Use the name assigned to the YEAR calculation when GROUPING the response data.--->
					<cfquery datasource="hdStreet-training" name="rsNewsYears">
						SELECT YEAR(FLD_NEWSCREATIONDATE) as FLD_newsYear
						FROM TBL_NEWS
						ORDER BY FLD_NEWSCREATIONDATE DESC
					</cfquery>
					
					<h1>News archive</h1>
					<ul>
						<cfoutput query="rsNewsYears" group="FLD_newsYear"> 	 <!---Executes SQL group command--->
							<li><a href="news.cfm?year=#FLD_newsYear#">#FLD_newsYear#</a></li>
						</cfoutput>
					</ul>
					<p class="alignRight">
						&nbsp;
					</p>
				</div>
			</div>
			<div id="footer">
				<p>
					&copy; Copyright 2011 - HD Street Concert Band
				</p>
			</div>
		</div>
	</body>
</html>
