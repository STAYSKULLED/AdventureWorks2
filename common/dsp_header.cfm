<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panda Commerce</title>
    <link rel="shortcut icon" href="/images/icon.png" type="image/x-icon">

    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 css local -->
    <!-- <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.css"> -->

    <!-- bootstrap 5 css cdn -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <!--- custom css --->
    <link rel="stylesheet" href="/style.css">

    <!--- sweet alert 2 cdn --->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
              <a title="Logo" class="navbar-brand" href="/index.cfm">
                  <img src="/images/logo.png" alt="">
              </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                  <li class="nav-item mx-3">
                    <a class="nav-link" aria-current="page" href="/index.cfm#">Home</a>
                  </li>
                  <li class="nav-item mx-3">
                    <a class="nav-link" href="/index.cfm#shoes">Shoes</a>
                  </li>
                  <li class="nav-item mx-3">
                    <a class="nav-link" href="/index.cfm#backpacks">Backpacks</a>
                  </li>
                  <li class="nav-item mx-3">
                    <a class="nav-link" href="/index.cfm#watches">Watches</a>
                  </li>
                  <li class="nav-item mx-3">
                    <a class="nav-link" href="#subscribe">Subscribe</a>
                  </li>
                  <li class="nav-item mx-3">
                    <a class="nav-link " href="index.cfm?fuseaction=ViewCustomers&showCustomers=all">Customers</a>
                  </li>
                  <li class="nav-item mx-3">
                    <a class="nav-link " href="/suppliers/index.cfm?fuseaction=ViewSuppliers&showSuppliers=all">Suppliers</a>
                  </li>
                  <li class="nav-item mx-3">
                    <a class="nav-link" href="/employees/index.cfm?fuseaction=ViewEmployees&showEmployees=all">Employees</a>
                  </li>
                </ul>
              </div>
            </div>
        </nav>
    </div>