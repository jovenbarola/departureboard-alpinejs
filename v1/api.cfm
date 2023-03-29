<cfquery name="qryResult">
    SELECT * FROM departures
</cfquery>

<cfheader name="Content-type" value="application/json" />
<cfoutput>#serializeJSON(qryResult, "struct")#</cfoutput>