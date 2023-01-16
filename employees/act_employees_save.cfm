<cfif isDefined("previousFuseaction") AND previousFuseaction EQ "AddNewEmployee ">
    <!--- this will run when the previous fuseaction is AddNewEmployee  --->
    <cfinclude template="act_employee s_new.cfm">
<cfelse>
    <!--- this will run when the previous fuseaction is EditEmployee  --->
    <cfinclude template="act_employee s_edit.cfm">
</cfif>