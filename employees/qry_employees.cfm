<cfif isDefined("fuseaction") AND fuseaction EQ "ViewEmployees">
    <cfif isDefined("showEmployees") AND showEmployees EQ "all">
        <!--- get all the employee records from the database by this query --->
        <cfquery name="getAllEmployeesRecords" datasource="#main_dsn#">
            SELECT p.BusinessEntityID AS EmployeeID, 
                Title, FirstName, LastName, MiddleName, Suffix, 
                AddressLine1, AddressLine2, City, PersonType,
                StateProvinceCode AS StateCode, PostalCode, 
                CountryRegionCode AS CountryCode,
                EmailAddress, PhoneNumber
            FROM Person.Person p
            RIGHT JOIN Person.EmailAddress pe ON p.BusinessEntityID =  pe.BusinessEntityID
            RIGHT JOIN Person.PersonPhone pp ON p.BusinessEntityID =  pp.BusinessEntityID 
            RIGHT JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
            RIGHT JOIN Person.Address pa ON bea.AddressID = pa.AddressID
            RIGHT JOIN Person.StateProvince sp ON pa.StateProvinceID = sp.StateProvinceID
            WHERE (p.BusinessEntityID IS NOT NULL AND PersonType = 'IN' AND CountryRegionCode = 'US')
            AND LastName LIKE 'A%'
            ORDER BY LastName ASC
        </cfquery>
        <cfquery name="getAllCountryCodes" datasource="#main_dsn#">
            SELECT CountryRegionCode AS CountryCode, Name AS CountryName, ModifiedDate AS CountryLastCHange
            FROM Person.CountryRegion
            ORDER BY Name ASC
        </cfquery>
    <cfelse>
        <!--- get single employee record by using the ID/EmployeeID from the database by this query --->
        <cfquery name="getSingleEmployeesRecord" datasource="#main_dsn#">
            SELECT p.BusinessEntityID AS EmployeeID, 
                Title, FirstName, LastName, MiddleName, Suffix, 
                AddressLine1, AddressLine2, City, PersonType,
                StateProvinceCode AS StateCode, PostalCode, 
                CountryRegionCode AS CountryCode,
                EmailAddress, PhoneNumber, pnt.Name AS PhoneNumberType
            FROM Person.Person p
            RIGHT JOIN Person.EmailAddress pe ON p.BusinessEntityID =  pe.BusinessEntityID
            RIGHT JOIN Person.PersonPhone pp ON p.BusinessEntityID =  pp.BusinessEntityID 
            Right JOIN Person.PhoneNumberType pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
            RIGHT JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
            RIGHT JOIN Person.Address pa ON bea.AddressID = pa.AddressID
            RIGHT JOIN Person.StateProvince sp ON pa.StateProvinceID = sp.StateProvinceID
            WHERE p.BusinessEntityID = #EmployeeID#
        </cfquery>
    </cfif>
<cfelseif isDefined("fuseaction") AND fuseaction EQ "AddNewEmployee">
    <!--- getting the telephone number types from the database --->
    <cfquery name="getPhoneNumberTypes" datasource="#main_dsn#">
        SELECT * FROM Person.PhoneNumberType
    </cfquery>

<cfelseif isDefined("fuseaction") AND fuseaction EQ "EditEmployee">
    <!--- get single employee record by using the ID/EmployeeID from the database by this query --->
    <cfquery name="getSingleEmployeesRecord" datasource="#main_dsn#">
        SELECT p.BusinessEntityID AS EmployeeID, 
            Title, FirstName, LastName, MiddleName, Suffix, 
            AddressLine1, AddressLine2, City, PersonType,
            StateProvinceCode AS StateCode, PostalCode, 
            CountryRegionCode AS CountryCode,
            EmailAddress, PhoneNumber, pnt.Name AS PhoneNumberType, pnt.PhoneNumberTypeID AS PhoneNumberTypeID
        FROM Person.Person p
        RIGHT JOIN Person.EmailAddress pe ON p.BusinessEntityID =  pe.BusinessEntityID
        RIGHT JOIN Person.PersonPhone pp ON p.BusinessEntityID =  pp.BusinessEntityID 
        Right JOIN Person.PhoneNumberType pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
        RIGHT JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
        RIGHT JOIN Person.Address pa ON bea.AddressID = pa.AddressID
        RIGHT JOIN Person.StateProvince sp ON pa.StateProvinceID = sp.StateProvinceID
        WHERE p.BusinessEntityID = #EmployeeID#
    </cfquery>
    <cfset thisPhoneNumberTypeID = #getSingleEmployeesRecord.PhoneNumberTypeID#>
    <!--- getting the telephone number types from the database --->
    <cfquery name="getPhoneNumberTypes" datasource="#main_dsn#">
        SELECT * FROM Person.PhoneNumberType
    </cfquery>
<cfelseif isDefined("fuseaction") AND fuseaction EQ "FilterEmployees">
    <!--- getting the filtered employees from here --->
    <cfquery name="getAllEmployeesRecords" datasource="#main_dsn#">
        SELECT p.BusinessEntityID AS EmployeeID, 
            Title, FirstName, LastName, MiddleName, Suffix, 
            AddressLine1, AddressLine2, City, PersonType,
            StateProvinceCode AS StateCode, PostalCode, 
            CountryRegionCode AS CountryCode,
            EmailAddress, PhoneNumber
        FROM Person.Person p
        RIGHT JOIN Person.EmailAddress pe ON p.BusinessEntityID =  pe.BusinessEntityID
        RIGHT JOIN Person.PersonPhone pp ON p.BusinessEntityID =  pp.BusinessEntityID 
        RIGHT JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
        RIGHT JOIN Person.Address pa ON bea.AddressID = pa.AddressID
        RIGHT JOIN Person.StateProvince sp ON pa.StateProvinceID = sp.StateProvinceID
        WHERE (p.BusinessEntityID IS NOT NULL AND PersonType = 'IN' AND CountryRegionCode = '#SelectedCountry#')
        <cfif isDefined("SelectedLetter") AND SelectedLetter NEQ "">
            AND LastName LIKE '#SelectedLetter#%'
        </cfif>
        ORDER BY LastName ASC
    </cfquery>
     <cfquery name="getAllCountryCodes" datasource="#main_dsn#">
        SELECT CountryRegionCode AS CountryCode, Name AS CountryName, ModifiedDate AS CountryLastCHange
        FROM Person.CountryRegion
        ORDER BY Name ASC
    </cfquery>
</cfif>