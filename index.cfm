<!--- Please insert your code here --->
<body>
	<!---Step 1 - Create an array using explicit notation--->
	<cfset myArrayExplicit = arrayNew(1)/>
	<cfset myArrayExplicit[1] = 'Red' />
	<cfset myArrayExplicit[2] = 'Green' />
	<cfset myArrayExplicit[3] = 'Blue' />

	<p>Dump the explicit array</p>
	<cfdump var=#myArrayExplicit# label="Explicit" />
	
	<!---Step 2 - Create an array using the implicit array notation--->
	<cfset myArrayImplicit = ['Red', 'Green', 'Blue', 'Yellow'] />
	
	<p>Dump the implicit array</p>
	<cfdump var=#myArrayImplicit# label="Implicit" />
	
	<!---Step 3 - use arrayLen()--->
	<cfoutput><br>myArrayExplicit Length: #arrayLen(myArrayExplicit)#</cfoutput>
	<cfoutput><br>myArrayImplicit Length: #arrayLen(myArrayImplicit)#</cfoutput>

    
	<h1>The myArrayExplicit array contains these <cfoutput>#arrayLen(myArrayExplicit)#</cfoutput> Elements:</h1>
    
	<!---Step 4 - use <cfloop> to loop over the array--->
    <cfoutput>
    	<cfloop from="1" to="#arrayLen(myArrayExplicit)#" index="i">
    		Index #i#: #myArrayExplicit[i]#<br>
    	</cfloop>
    </cfoutput>

	<h1>The myArrayImplicit array now contains <cfoutput>#arrayLen(myArrayImplicit)#</cfoutput> Elements with additions at BOTH ends: </h1>h1>
	<!--- Step 5 - Use arrayAppend() and arrayPrepend() --->
	<cfset arrayAppend(myArrayImplicit,'Pink')/>
	<cfset arrayPrepend(myArrayImplicit,'Purple')/>
	
	<cfoutput>
		<cfloop from="1" to="#arrayLen(myArrayImplicit)#" index="i">
			Index #i#: #myArrayImplicit[i]#<br>
		</cfloop>
	</cfoutput>
	
	
	<br />
	<!---Step 6 - Use arrayDeleteAt() --->
	<h1>Delete myArrayExplicit Next ...</h1>
	<p>myArrayExplicit contained:  <cfoutput>#arrayToList(myArrayExplicit)#</cfoutput></p>
	<p>myArrayExplicit after deleting contains:  <cfoutput>#arrayDeleteAll(myArrayExplicit)#</cfoutput>
	

</body>