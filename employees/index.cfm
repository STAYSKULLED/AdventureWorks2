<cfset main_dsn = "AdventureWorks">

<cfinclude template="/common/dsp_header.cfm" >
<cfif isDefined("fuseaction") AND fuseaction EQ "ViewEmployees">
    <!--- we are running the qry file to get employees records --->
    <cfinclude template="qry_employees.cfm">
    <!--- according to the showEmployees variable value we will show all records or only a single record in this page --->
    <cfinclude template="dsp_employees_view.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "AddNewEmployee">
    <!--- we might use this for getting some of the dropdown values --->
    <cfinclude template="qry_employees.cfm">
    <!--- displaying a new employee form page --->
    <cfinclude template="dsp_employees_new.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "DeleteEmployee">
    <!--- deleting a employee  --->
    <cfinclude template="act_employees_delete.cfm">
    <!--- after deleting the record we are running the ViewEmployees fuseaction again to see the updated list of employees --->
    <script>
         document.location.replace('/employees/index.cfm?fuseaction=ViewEmployees&showEmployees=all')
    </script>

<cfelseif isDefined("fuseaction") AND fuseaction EQ "EditEmployee">
    <!--- to edit a single employees record we are collecting the info by their id in the qry --->
    <cfinclude template="qry_employees.cfm">
    <!--- will display that employees information with a new editable form --->
    <cfinclude template="dsp_employees_edit.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "SaveEmployee">
    <!--- after adding or editing a employee when we click on the submit button we will run the act file to update or to add the record --->
    <cfinclude template="act_employees_save.cfm">
    <!--- after updating or adding the record we will display that single new or updated record --->
    <cflocation url="index.cfm?fuseaction=ViewEmployees&showEmployees=single&EmployeeID=#EmployeeID#" />

     <!--- TODO: uncomment the codes after adding the queries and getting the variable from above --->
    <!--- <cfoutput>
        <script>
            document.location.replace('/employees/index.cfm?fuseaction=ViewEmployees&showEmployees=single&EmployeeID=#EmployeeID#')
       </script>
    </cfoutput> --->
<cfelseif isDefined("fuseaction") AND fuseaction EQ "FilterEmployees">
    <!--- display employees according Alphabetical order and country --->
    <cfinclude template="qry_employees.cfm">
    <cfinclude template="dsp_employees_view.cfm">
</cfif>

<cfinclude template="/common/dsp_footer.cfm" >