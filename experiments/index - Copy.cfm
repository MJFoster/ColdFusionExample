<html>
<head></head>
<body>
Site17 index.cfm file

<cfset variables.currentMonth = DatePart("m", Now())>
<cfset variables.currentYear = DatePart("yyyy", Now())>
<cfset variables.reportStartDate = DateFormat(DateAdd("m", -11, Now()), "mm/dd/yyyy")>
<cfset variables.reportStartMonth = DatePart("m", variables.reportStartDate)>
<cfset variables.lastDayOfMonth = DaysInMonth(Now())>
<cfset variables.lastDayOfFeb = DaysInMonth("02/01/2013")>

<cfoutput>
<br />
Current Month: #variables.currentMonth# <br />
Current Year: #variables.currentYear# <br />
Report Start Date: #variables.reportStartDate#<br />
Report Start Month: #variables.reportStartMonth#<br />
Number Days In Current Month: #variables.lastDayOfMonth#<br />
Days in February: #variables.lastDayOfFeb#<br />

<cfset BeginMonth1 = 69>
<cfset BeginMonth2 =100>

<cfloop index="i" from="1" to="2">
<cfset theName="BeginMonth" & #i#>
#i#: #Evaluate(theName)#  <br />
</cfloop>

<br />DateDiff examples:<br />
Months:<br />
<cfset theLastNotifyMonthDiff = datediff("m",'12/31/2015','9/12/2014')>
datediff("m",'12/31/2015','9/12/2014')<br />
theLastNotifyMonthDiff: #theLastNotifyMonthDiff#

<br /><br />Days: <br />
<cfset theLastNotifyMonthDiff = datediff("d",'9/13/2015','9/12/2015')>
datediff("d",'9/13/2015','9/12/2015')<br />
Days different return Value: #theLastNotifyMonthDiff#

<br /><br />
<cfdump var="#SERVER.Coldfusion.rootdir#" />
<br /><br />
                 	<cfset variables.currentYear = DateFormat(Now(), "yyyy")>
					<cfset FiscalYear = 2015>
                    <select name="txtFY" id="txtFY" onChange="alert('fiscal year has changed');">
                    	<option value="1">1</option>
                      <option value="2">2</option>
                    	<cfloop index="iii" from="2" to="0" step="-1">
						<cfset variables.nextYear = variables.currentYear - iii>
                    	<option value="#variables.nextYear#" <cfif FiscalYear EQ variables.nextYear> selected </cfif>>#variables.nextYear#</option>
                      </cfloop>
                    </select>



</cfoutput>
</body>
</html>
