<cfif isDefined("URL.action")>
    <cfset action = #URL.action#>

    <cfif #action# EQ "CHANGE_STATUS">
        <cfquery name="qryChangeStatus">
            UPDATE departures 
            SET remarks = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.status#"> 
            WHERE flightno = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.flightno#">
        </cfquery>
    </cfif>

</cfif>

<cfquery name="qryResult">
    SELECT * FROM departures
</cfquery>

<cfheader name="Content-type" value="application/json" />
<cfoutput>#serializeJSON(qryResult, "struct")#</cfoutput>