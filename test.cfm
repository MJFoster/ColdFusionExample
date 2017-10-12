<h3>FormatBaseN Example</h3> 
<p>Converts a number to a string in the base specified by Radix. 
<p> 
<cfset currMonth = month(now()) />
<cfset currDay = day(now()) />
<cfset currYear = year(now()) />
<cfset currDateStr = FormatBaseN(currYear,10) & FormatBaseN(currMonth,10) & FormatBaseN(currDay,10) />
<cfoutput> 
<br>FormatBaseN(currMonth,10): #FormatBaseN(currMonth,10)#
<br>FormatBaseN(currDay,10): #FormatBaseN(currDay,10)# 
<br>FormatBaseN(currYear,10): #FormatBaseN(currYear,10)#
<br>Concatenated dateStr: #currDateStr#
</cfoutput> 

<cfoutput> 
<ul> 
<li>#TimeFormat(now())# 
<li>#TimeFormat(now(), "hh:nn:ss")# 
<li>#TimeFormat(now(), "hh:nn:sst")# 
<li>#TimeFormat(now(), "hh:nn:sstt")# 
<li>#TimeFormat(now(), "HH:nn:ss")# 
</ul> 
</cfoutput>