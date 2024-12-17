<!DOCTYPE html>
<html lang="en">
    <cfoutput>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            
            <link href="../resource/public/css/bootstrap.min.css" rel="stylesheet">
            <!--- Custom styles for this template --->
            <link href="../resource/public/assets/css/dashboard.css" rel="stylesheet">

            <link href="https://cdn.datatables.net/v/bs5/dt-2.1.8/datatables.min.css" rel="stylesheet">

            <title>#rc.appSettings.title#</title>
        </head>
        <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
            font-size: 3.5rem;
            }
        }
        </style>
            <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
                <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="">#rc.appSettings.h1Title#</a>
                
                <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
                <div class="navbar-nav">
                    <div class="nav-item text-nowrap">
                    <a class="nav-link px-3" href="">Sign out</a>
                    </div>
                </div>
            </header>
        <body>           

            #body#
        </body>
    </cfoutput>
    <script src="../resource/public/js/bootstrap.min.js"></script>
    <script src="../resource/public/assets/css/js/jquery/jquery.js"></script>
    <script src="../resource/public/assets/css/js/datatable/datatable.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
</html>