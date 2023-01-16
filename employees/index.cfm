<cfset main_dsn = "AdventureWorks">

<cfinclude template="/common/dsp_header.cfm" >
<cfif isDefined("fuseaction") AND fuseaction EQ "ViewEmployee s">
    <!--- we are running the qry file to get employee s records --->
    <cfinclude template="qry_employee s.cfm">
    <!--- according to the showEmployee s variable value we will show all records or only a single record in this page --->
    <cfinclude template="dsp_employee s_view.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "AddNewEmployee ">
    <!--- we might use this for getting some of the dropdown values --->
    <cfinclude template="qry_employee s.cfm">
    <!--- displaying a new employee  form page --->
    <cfinclude template="dsp_employee s_new.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "DeleteEmployee ">
    <!--- deleting a employee   --->
    <cfinclude template="act_employee s_delete.cfm">
    <!--- after deleting the record we are running the ViewEmployee s fuseaction again to see the updated list of employee s --->
    <script>
         document.location.replace('/employee s/index.cfm?fuseaction=ViewEmployee s&showEmployee s=all')
    </script>

<cfelseif isDefined("fuseaction") AND fuseaction EQ "EditEmployee ">
    <!--- to edit a single employee s record we are collecting the info by their id in the qry --->
    <cfinclude template="qry_employee s.cfm">
    <!--- will display that employee s information with a new editable form --->
    <cfinclude template="dsp_employee s_edit.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "SaveEmployee ">
    <!--- after adding or editing a employee  when we click on the submit button we will run the act file to update or to add the record --->
    <cfinclude template="act_employee s_save.cfm">
    <!--- after updating or adding the record we will display that single new or updated record --->
    <cflocation url="index.cfm?fuseaction=ViewEmployee s&showEmployee s=single&Employee ID=#Employee ID#" />

     <!--- TODO: uncomment the codes after adding the queries and getting the variable from above --->
    <!--- <cfoutput>
        <script>
            document.location.replace('/employee s/index.cfm?fuseaction=ViewEmployee s&showEmployee s=single&Employee ID=#Employee ID#')
       </script>
    </cfoutput> --->
<cfelseif isDefined("fuseaction") AND fuseaction EQ "FilterEmployee s">
    <!--- display employee s according Alphabetical order and country --->
    <cfinclude template="qry_employee s.cfm">
    <cfinclude template="dsp_employee s_view.cfm">
</cfif>

<cfinclude template="/common/dsp_footer.cfm" >