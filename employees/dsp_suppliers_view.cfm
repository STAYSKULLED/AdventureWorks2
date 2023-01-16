<div class="container">
    <div class="border border-secondary text-center rounded p-3">
        <h1 class="title mb-0 fw-bold">
            <cfif isDefined("showEmployee s") AND showEmployee s EQ "all">
                Employee s
            <cfelse>
                <cfoutput query="getSingleEmployee sRecord">
                    Employee  No. #Employee ID#
                </cfoutput>
            </cfif>
        </h1>
    </div>
    <div class="my-4 text-end">
        <a href="index.cfm?fuseaction=AddNewEmployee " class="btn btn-primary">Add New Employee </a>
    </div>
    <cfif isDefined("showEmployee s") AND showEmployee s EQ "all">
        <div>
            <form action="index.cfm" method="POST" name="FilterEmployee sForm" class="row mx-0 mb-4 gap-3">
                <h4 class="p-0 fw-bold w-auto my-auto">Filter:</h4>
                <input type="hidden" name="showEmployee s" value="all">
                <input type="hidden" name="fuseaction" value="FilterEmployee s">
                <cfoutput>
                    <input class="form-control w-auto" size="1" name="SelectedLetter" placeholder="A-Z" maxlength="1" title="First character of the Employee s last name (A-Z)" pattern="[A-Za-z]{1}" <cfif isDefined("SelectedLetter") AND SelectedLetter NEQ "">value="#SelectedLetter#"<cfelse>value="A"</cfif> style="text-transform:uppercase" required>
                </cfoutput>
                <select class="form-select w-auto" name="SelectedCountry">
                    <cfoutput query="getAllCountryCodes">
                        <option <cfif ( NOT isDefined("SelectedCountry") AND CountryCode EQ "US" ) OR ( isDefined("SelectedCountry") AND SelectedCountry EQ CountryCode) >selected</cfif> value="#CountryCode#">#CountryName#</option>
                    </cfoutput>
                </select>
                <button type="submit" class="btn btn-primary w-auto">Go</button>
            </form>
        </div>
        <div class="table-responsive rounded">
            <table class="table border">
                <thead class="table-custom">
                    <tr>
                        <th nowrap>First Name</th>
                        <th nowrap>Last Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead> 
                <tbody>
                    <cfoutput query="getAllEmployee sRecords">
                        <tr>
                            <td>
                                #FirstName#
                            </td>
                            <td>
                                #LastName#
                            </td>
                            <td>
                                #PhoneNumber#
                            </td>
                            <td>
                                #EmailAddress#
                            </td>
                            <td>
                                #City#, #StateCode#
                            </td>
                            <td class="flex">
                                <form action="index.cfm" method="POST" name="ViewEmployee Form_#Employee ID#" class="d-inline" title="See More">
                                    <input type="hidden" name="fuseaction" value="ViewEmployee s">
                                    <input type="hidden" name="Employee ID" value="#Employee ID#">
                                    <input type="hidden" name="showEmployee s" value="single">
                                    <input type="submit" class="d-none" id="viewEmployee Submit_#Employee ID#">
                                    <label class="action-btn view-btn" for="viewEmployee Submit_#Employee ID#">
                                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                        </svg>
                                    </label>
                                </form>

                                <form action="index.cfm" method="POST" name="EditEmployee Form_#Employee ID#" class="d-inline" title="Edit Employee ">
                                    <input type="hidden" name="fuseaction" value="EditEmployee ">
                                    <input type="hidden" name="Employee ID" value="#Employee ID#">
                                    <input type="submit" class="d-none" id="editEmployee Submit_#Employee ID#">
                                    <label class="action-btn edit-btn" for="editEmployee Submit_#Employee ID#">
                                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                        </svg>
                                    </label>
                                </form>
                                
                                <!--- Commented the delete function --->
                                <!--- <form action="index.cfm" method="POST" name="DeleteEmployee Form_#Employee ID#" class="d-inline" id="DeleteEmployee Form_#Employee ID#">
                                    <input type="hidden" name="fuseaction" value="DeleteEmployee ">
                                    <input type="hidden" name="Employee ID" value="#Employee ID#">
                                    <label class="action-btn delete-btn" id="delete-btn_#Employee ID#">
                                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                        </svg>
                                    </label>
                                </form> --->
                                <!--- <cfoutput> --->
                                    <!--- <script>
                                        const deleteBtn_#Employee ID# = document.getElementById("delete-btn_#Employee ID#");
                                        deleteBtn_#Employee ID#.onclick = () => {
                                            Swal.fire({
                                            position: 'center',
                                            allowEscapeKey: false,
                                            allowOutsideClick: false,
                                            icon: 'warning',
                                            title: '<span style="color:##000">Are you sure you want to delete this employee ?</span>',
                                            showConfirmButton: true,
                                            confirmButtonColor: "##ff6358",
                                            confirmButtonText: 'Confirm',
                                            focusConfirm: false,
                                            showCancelButton: true,
                                            cancelButtonText: 'Cancel',
                                            focusCancel: true,
                                            }).then((result) => {
                                                if (result.isConfirmed){
                                                    document.getElementById("DeleteEmployee Form_#Employee ID#").submit();
                                                } else if (result.isDismissed){
                                                    Swal.close();
                                                }
                                            })
                                        }
                                    </script> --->
                                <!--- </cfoutput> --->
                            </td>
                        </tr>
                    </cfoutput>
                </tbody>
            </table>
        </div>
    <cfelse>
        <cfoutput query="getSingleEmployee sRecord">
            <div class="flex text-end">
                <form action="index.cfm" method="POST" name="EditEmployee Form_#Employee ID#" class="d-inline" title="Edit Employee ">
                    <input type="hidden" name="fuseaction" value="EditEmployee ">
                    <input type="hidden" name="Employee ID" value="#Employee ID#">
                    <input type="submit" class="d-none" id="editEmployee Submit_#Employee ID#">
                    <label class="action-btn edit-btn" for="editEmployee Submit_#Employee ID#">
                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                        </svg>
                    </label>
                </form>
                
                <!--- Commented the delete function --->
                <!--- <form action="index.cfm" method="POST" name="DeleteEmployee Form_#Employee ID#" class="d-inline" id="DeleteEmployee Form_#Employee ID#">
                    <input type="hidden" name="fuseaction" value="DeleteEmployee ">
                    <input type="hidden" name="Employee ID" value="#Employee ID#">
                    <label class="action-btn delete-btn" id="delete-btn_#Employee ID#">
                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                        </svg>
                    </label>
                </form> --->
                <!--- <cfoutput> --->
                    <!--- <script>
                        const deleteBtn_#Employee ID# = document.getElementById("delete-btn_#Employee ID#");
                        deleteBtn_#Employee ID#.onclick = () => {
                            Swal.fire({
                            position: 'center',
                            allowEscapeKey: false,
                            allowOutsideClick: false,
                            icon: 'warning',
                            title: '<span style="color:##000">Are you sure you want to delete this employee ?</span>',
                            showConfirmButton: true,
                            confirmButtonColor: "##ff6358",
                            confirmButtonText: 'Confirm',
                            focusConfirm: false,
                            showCancelButton: true,
                            cancelButtonText: 'Cancel',
                            focusCancel: true,
                            }).then((result) => {
                                if (result.isConfirmed){
                                    document.getElementById("DeleteEmployee Form_#Employee ID#").submit();
                                } else if (result.isDismissed){
                                    Swal.close();
                                }
                            })
                        }
                    </script> --->
                <!--- </cfoutput> --->
            </div>
            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th>Title</th>
                            <th nowrap>First Name</th>
                            <th nowrap>Middle Name</th>
                            <th nowrap>Last Name</th>
                            <th>Suffix</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <tr>
                            <td>
                                <cfif isDefined("Title") AND Title NEQ "">
                                    #Title#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("FirstName") AND FirstName NEQ "">
                                    #FirstName#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("MiddleName") AND MiddleName NEQ "">
                                    #MiddleName#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("LastName") AND LastName NEQ "">
                                    #LastName#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("Suffix") AND Suffix NEQ "">
                                    #Suffix#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th colspan="2">Phone</th>
                            <th>Email</th>
                        </tr>
                    </thead> 
                    <tbody>
                            <td>
                                <cfif isDefined("PhoneNumberType") AND PhoneNumberType NEQ "">
                                    #PhoneNumberType#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("PhoneNumber") AND PhoneNumber NEQ "">
                                    #PhoneNumber#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("EmailAddress") AND EmailAddress NEQ "">
                                    #EmailAddress#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th>Address Line 1</th>
                            <th>Address Line 2</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Postal Code</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <tr>
                            <td>
                                <cfif isDefined("AddressLine1") AND AddressLine1 NEQ "">
                                    #AddressLine1#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("AddressLine2") AND AddressLine2 NEQ "">
                                    #AddressLine2#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("City") AND City NEQ "">
                                    #City#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("StateCode") AND StateCode NEQ "">
                                    #StateCode#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("PostalCode") AND PostalCode NEQ "">
                                    #PostalCode#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <a href="/employee s/index.cfm?fuseaction=ViewEmployee s&showEmployee s=all" class="btn btn-secondary">Go Back</a>
                </div>
            </div>
        </cfoutput>
    </cfif>
</div>