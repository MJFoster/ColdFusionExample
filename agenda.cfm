<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>
			HD Street Concert Band - Agenda
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
					<span>`
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
					<li>
						<a href="index.html">
							Home
						</a>
					</li>
					<li>
						<a href="agenda.html">
							Agenda
						</a>
					</li>
					<li>
						<a href="#">The Band</a>
						<ul>
							<li>
								<a href="director.html">
									The director
								</a>
							</li>
							<li>
								<a href="history.html">
									The band History
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="wePlayForYou.html">
							We play for You
						</a>
					</li>
					<li>
						<a href="comePlayWithUs.html">
							Come play with us
						</a>
					</li>
					<li>
						<a href="news.html">
							News
						</a>
					</li>
				</ul>
			</div>
			<div id="pageBody">
				<div id="calendarContent">
					<!---If the page request url contains the 'eventID' variable, render a single event detail,
							otherwise, render all events on or after the current date. --->
					<cfif isDefined('url.eventID')>
						<!---Render single event specified by eventID --->
						<cfquery datasource="hdStreet-training" name="rsSingleEventDetail">
							SELECT 	FLD_EVENTID, FLD_EVENTNAME, FLD_EVENTDATETIME, 
									FLD_EVENTLOCATION, FLD_EVENTVENUE, FLD_EVENTDESCRIPTION
							FROM TBL_EVENTS
							WHERE FLD_EVENTID = #url.eventID#
						</cfquery>
						<cfoutput>
							<!---Specific Event Details go here--->
							<h1>#rsSingleEventDetail.FLD_EVENTNAME#</h1>
							<p>#rsSingleEventDetail.FLD_EVENTDESCRIPTION#</p>
							<a href="agenda.cfm">Back to the Agenda</a>
						</cfoutput>
					<cfelse>
						<!---Render all events on or after currentDate --->
					
						<!--- Set currentDate for testing purposes to force query to return some records. --->
						<cfset currentDate = CreateDate(2016,01,01)/>
						<!---<cfset currentDate = #now()# />--->
						
						<!-- Query db for events, rsCurrent_Events = response set that includes the recordCount in the metadata
						property-->
						<cfquery datasource='hdStreet-training' name='rsCurrentEvents'>
							SELECT 	FLD_EVENTID, FLD_EVENTDATETIME, FLD_EVENTNAME, FLD_EVENTLOCATION, 
									FLD_EVENTVENUE, FLD_EVENTDESCRIPTION
							FROM TBL_EVENTS
							WHERE FLD_EVENTDATETIME >= #currentDate# ORDER BY FLD_EVENTDATETIME ASC 
						</cfquery>
					
						<h1>Agenda</h1>
						<cfif rsCurrentEvents.recordCount EQ 0>
							<p>
								Sorry, there are no future events.
							</p>
						<cfelse>
							<table>
								<cfoutput query="rsCurrentEvents">
									<tr>
										<td>#dateFormat(FLD_EVENTDATETIME, 'mmm dd yyyy')#</td>
										<td>#FLD_EVENTNAME# - #FLD_EVENTLOCATION# (#FLD_EVENTVENUE#)</td>
										<td><a href="agenda.cfm?eventID=#FLD_EVENTID#">Read More</a></td>
									</tr>
								</cfoutput>
							</table>
						</cfif>  	<!---recordCount conditional --->
					</cfif>			<!---Check on specific eventID--->
				</div>				<!---End of calendarContent--->
					
				<div id="calendarSideBar">
					<cfif isDefined('url.eventID')>
						<h1>Event details</h1>
						<cfset eventDate = rsSingleEventDetail.FLD_EVENTDATETIME />
						<cfset eventName = rsSingleEventDetail.FLD_EVENTNAME />
					<cfelseif rsCurrentEvents.recordCount EQ 0>
						<h1>Next Event</h1>
						<p>Sorry, there are no upcoming events.</p>	
					<cfelse>
						<h1>Next Event</h1>
						<cfset eventDate = rsCurrentEvents.FLD_EVENTDATETIME />
						<cfset eventName = rsCurrentEvents.FLD_EVENTNAME />
					</cfif>
					
					<!---Now render the different dates & details based on whether or not you are
							displaying 1 event, multiple event, or no events --->
					<cfoutput>
						<div id="EventDetails">
							<p id="eventDate">
								<span id="month">
									#dateFormat(eventDate,'mmm')#
								</span>
								<span id="days">
									#dateFormat(eventDate,"dd")#
								</span>
							</p>
							<h2>#eventName#</h2>
								
							<cfif isDefined('url.eventID')>
								<p id="eventTime"> #timeFormat(eventDate)#</p>
							<cfelseif rsCurrentEvents.recordCount GE 1>
								<h2>#rsCurrentEvents.FLD_EVENTLOCATION#</h2>
							</cfif>
						</div>	<!---End of EventDetails--->

						<cfif isDefined('url.eventID')>
							<p>#rsSingleEventDetail.FLD_EVENTVENUE#</p>
							<p>#rsSingleEventDetail.FLD_EVENTLOCATION#</p>
						<cfelseif rsCurrentEvents.recordCount GE 1>
							<p>#rsCurrentEvents.FLD_EVENTDESCRIPTION#</p>
							<p class="alignRight">
								<a href="agenda.cfm?eventID=#rsCurrentEvents.FLD_EVENTID#">Read More</a>
							</p>														
						</cfif>
					</cfoutput>
				</div>			<!---End of calendarSideBar --->
			</div>				<!---End of pageBody --->
			
			<div id="footer">
				<p>
					&copy; Copyright 2011 - HD Street Concert Band
				</p>
			</div>
		</div>	<!---End of wrapper--->
	</body>
</html>