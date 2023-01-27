<cfif isDefined("previousFuseaction") AND previousFuseaction EQ "AddNewEmployee">
    <!--- this will run when the previous fuseaction is AddNewEmployee --->
    <cfinclude template="act_employees_new.cfm">
<cfelse>
    <!--- this will run when the previous fuseaction is EditEmployee --->
    <cfinclude template="act_employees_edit.cfm">
</cfif>