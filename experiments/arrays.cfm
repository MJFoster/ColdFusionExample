<!--- Please insert your code here --->
<body>
	<!---Step 1 - Create an array using explicit notation--->
	<cfset Explicit = arrayNew(1)/>
	<cfset Explicit[1] = 'Red' />
	<cfset Explicit[2] = 'Green' />
	<cfset Explicit[3] = 'Blue' />

	<p>Dump the Explicit array</p>
	<cfdump var=#Explicit# label="Explicit" />
	
	<!---Step 2 - Create an array using the implicit array notation--->
	<cfset Implicit = ['Red', 'Green', 'Blue', 'Yellow'] />
	
	<p>Dump the Implicit array</p>
	<cfdump var=#Implicit# label="Implicit" />
	
	<!---Step 3 - use arrayLen()--->
	<cfoutput><br>Explicit Array's Length: #arrayLen(Explicit)#</cfoutput>
	<cfoutput><br>Implicit Array's Length: #arrayLen(Implicit)#</cfoutput>

    
	<h1>The Explicit array contains these <cfoutput>#arrayLen(Explicit)#</cfoutput> Elements:</h1>
    
	<!---Step 4 - use <cfloop> to loop over the array--->
    <cfoutput>
    	<cfloop from="1" to="#arrayLen(Explicit)#" index="i">
    		Index #i#: #Explicit[i]#<br>
    	</cfloop>
    </cfoutput>

	<h1>The Implicit array now contains <cfoutput>#arrayLen(Implicit)#</cfoutput> Elements with additions at BOTH ends: </h1>
	<!--- Step 5 - Use arrayAppend() and arrayPrepend() --->
	<cfset arrayAppend(Implicit,'Pink')/>
	<cfset arrayPrepend(Implicit,'Purple')/>
	
	<cfoutput>
		<cfloop from="1" to="#arrayLen(Implicit)#" index="i">
			Index #i#: #Implicit[i]#<br>
		</cfloop>
	</cfoutput>
	
	
	<br />
	<!---Step 6 - Use arrayDeleteAt() --->
	<h1>Delete the 1st and last elements of Implicit</h1>
	<p>CURRENTLY Implicit array contains:  <cfoutput>#arrayToList(Implicit)#</cfoutput></p>
	
	<cfset arrayDeleteAt(Implicit,#arrayLen(Implicit)#)/>
	<cfset arrayDeleteAt(Implicit,1)/>	
	<p>AFTER deleting 1st and last, Implicit array now contains:  <cfoutput>#arraytoList(Implicit)#</cfoutput></p>
	
	
	
	<!---Step 7 - Use arrayClear() --->
	<h1>Delete Explicit array Next ...</h1>
	<p>CURRENTLY Explicit array contains:  <cfdump var=#Explicit# label="Explicit"/></p>

	<cfset arrayClear(Explicit)/>
	<p>AFTER CLEARING, Explicit array contains:  <cfoutput>#arrayToList(Explicit)#</cfoutput>
	


</body>