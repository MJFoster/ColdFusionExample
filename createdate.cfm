<h3>CreateDate Example</h3> 
<cfif IsDefined("form.year")> 
<p>Your date value, generated with CreateDate:</p> 
<cfset yourDate = CreateDate(form.year, form.month, form.day)> 
<cfoutput> 
<ul> 
    <li>Formatted with CreateDate: #CreateDate(form.year, form.month, form.day)#</li> 
    <li>Formatted with CreateDateTime: #CreateDateTime(form.year, form.month, 
        form.day, 12,13,0)#</li> 
    <li>Formatted with CreateODBCDate: #CreateODBCDate(yourDate)#</li> 
    <li>Formatted with CreateODBCDateTime: #CreateODBCDateTime(yourDate)#</li> 
</ul> 
 
<p>The same value can be formatted with DateFormat: 
<ul> 
    <li>Formatted with CreateDate and DateFormat:  
        #DateFormat(CreateDate(form.year, form.month, form.day), "mmm-dd-yyyy")#</li> 
    <li>Formatted with CreateDateTime and DateFormat:  
        #DateFormat(CreateDateTime(form.year, form.month, form.day, 12,13,0))#</li> 
    <li>Formatted with CreateODBCDate and DateFormat:  
        #DateFormat(CreateODBCDate(yourDate), "mmmm d, yyyy")#</li> 
    <li>Formatted with CreateODBCDateTime and DateFormat:  
        #DateFormat(CreateODBCDateTime(yourDate), "d/m/yy")#</li> 
</ul> 

<cfset NewAssessmentsDate = CreateDate(1998,6,9)/>

<p>Compare #yourDate# to #NewAssessmentsDate#"</p>
<cfif NewAssessmentsDate GT yourDate>
	<div>#DateFormat(NewAssessmentsDate, "yyyy-mm-dd")# > #DateFormat(yourDate, "yyyy-mm-dd")#</div>
<cfelse>
	<div>#DateFormat(NewAssessmentsDate, "yyyy-mm-dd")# <= #Dateformat(yourDate, "yyyy-mm-dd")#</div>
</cfif>
<p>Today's date:  #DateFormat(now(), "yyyy-mm-dd")#</p>
</cfoutput> 
</cfif> 

<cfform action="createdate.cfm" METHOD="POST"> 
<p>Enter the year, month, and day, as integers: 
<pre> 
Year<cfinput type="Text" name="year" value="1998" validate="integer" required="Yes"> 
Month<cfinput type="Text" name="month" value="6" validate="integer" required="Yes"> 
Day<cfinput type="Text" name="day" value="8" validate="integer" required="Yes"> 
</pre> 
<p><input type="Submit" name=""> <input type="RESET"> 
</cfform>