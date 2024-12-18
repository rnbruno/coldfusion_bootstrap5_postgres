
<meta charset="UTF-8">

<cfprocessingdirective pageEncoding="utf-8">

<cfoutput>

    <div class="container-fluid">   
        <div class="row">
            <cfoutput>
                 #headNav(rc.menus)#
            </cfoutput>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">#rc.subtitle#</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group me-2">
                    <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="##addCustomerModal">Add Customer</button>
                    <div class="modal fade" id="addCustomerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <form action="#BuildURL( action='customer.save' )#" method="post">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Customer</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body row">
                                            <div class="col-sm-4 mb-3">
                                                <label for="recipient-name" class="col-form-label">First Name:</label>
                                                <input type="text" class="form-control" name="customerFirstName" id="customerFirstName">
                                            </div>
                                            <div class="col-sm-4 mb-3">
                                                <label for="recipient-name" class="col-form-label">Last Name:</label>
                                                <input type="text" class="form-control" name="customerLastName" id="customerLastName">
                                            </div>
                                            <div class="col-sm-4 mb-3">
                                                <label for="recipient-name" class="col-form-label">Email:</label>
                                                <input type="text" class="form-control" name="customerEmailName" placeholder="Informe e-mail" id="customerEmailName">
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label">Description:</label>
                                                <textarea class="form-control" name="description" id="description"></textarea>
                                            </div>
                                            <div class="col-sm-6 mb-3">
                                                <label for="message-text" class="col-form-label">Cidade:</label>
                                                <select class="form-control" name="customerEstados" id="customerEstados">
                                                    <cfloop query="rc.cidades">
                                                        <option value="#rc.cidades.id#">#rc.cidades.nome#
                                                        </option>
                                                    </cfloop>
                                                </select>
                                            </div>
                                            <div class="col-sm-6 mb-3">
                                                <label for="message-text" class="col-form-label">Estado:</label>
                                                <select class="form-control" name="customerEstados" id="customerEstados">
                                                    <cfloop query="rc.estados">
                                                        <option value="#rc.estados.id#">#rc.estados.name# - #rc.estados.uf#
                                                        </option>
                                                    </cfloop>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label">Quantity:</label>
                                                <input type="number" class="form-control" name="quantity" id="quantity">
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" name="Submit" class="btn btn-primary">Save Customer</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="btn-group me-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                </div>
                <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                    <span data-feather="calendar"></span>
                    This week
                </button>
                </div>
            </div>

            <!---
           
            <h1>Preço do Produto: #formatPrice(199.99)#</h1>  Exibindo o valor formatado --->

            <h3>#rc.customerSubtitle#</h3>
            <div class="table-responsive">
                <table class="table table-striped table-sm" id="customers">
                    <thead>
                        <tr>
                            <th scope="col">First Name</th>   
                            <th scope="col">Last Name</th>
                            <th scope="col">Email</th>

                            <th scope="col">Phone</th>
                            <th scope="col">Address</th>
                            <th scope="col">City</th>

                            <th scope="col">Postal Code</th>
                            <th scope="col">Estados</th>
                            <th scope="col">Country</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <cfloop query="rc.customers">
                            <tr>
                                <td>#rc.customers.first_name#</td>
                                <td>#rc.customers.last_name#</td>
                                <td>#rc.customers.email#</td>

                                <td>#rc.customers.phone#</td>
                                <td>#rc.customers.address#</td>
                                <td>#rc.customers.city#</td>

                                <td>#rc.customers.postal_code#</td>
                                <td>#rc.customers.estado#</td>
                                <td>#rc.customers.country#</td>
                                <td> <button type="button" onclick="customerDelete(#rc.customers.customer_id#)" class="btn btn-sm btn-danger">Delete Customer</button></td>
                            </tr>
                        </cfloop>
                        
                    </tbody>
                </table>
            </div>
            </main>
        </div>
        <script src="../resource/public/assets/css/js/jquery/jquery.js"></script>
        <script src="../resource/public/assets/css/js/datatable/datatable.js"></script>
        <script>
            $('##customers').DataTable();

            function customerDelete(id){
           
                console.log(id);

                // Construir a URL dinamicamente com o `id` fornecido
                var deleteUrl = "#BuildURL(action='customer.delete')#&customerId=" + id;
                $.get({
                    url: deleteUrl,
                    method: "POST", 
                    success: function (response) {
                        alert("customer deleted successfully!");
                        console.log(response);
                    },
                    error: function (xhr, status, error) {
                        alert("An error occurred: " + error);
                    },
                });
            };
        </script>
    </div>
    <div id="home" class="page-header">
        <ol class="breadcrumb">
            <li>
                <a href="/">
                    Home
                </a>
            </li>
            <li class="active">
                MVC Demo - FW/1
            </li>
        </ol>
        <h1>#rc.appSettings.h1Title#</h1>
    </div>
    <cftry>
    <!--- Testa a conexão com o banco de dados executando uma consulta simples --->
    <cfquery name="testQuery" datasource="postgres1_1">
        SELECT 1 AS test;
    </cfquery>

    <!--- Se a consulta for bem-sucedida, mostra uma mensagem de sucesso --->
        <cfoutput>
            Conexão bem-sucedida ao banco de dados PostgreSQL!
        </cfoutput>

    <cfcatch>
        <!--- Se houver algum erro na conexão, captura e exibe a mensagem de erro --->
        <cfoutput>
            Erro ao conectar ao banco de dados: #cfcatch.message#
        </cfoutput>
    </cfcatch>
    </cftry>

    <div class="container">
        <ul>
            <li>
                <a href="#BuildURL( action='brewery.list' )#">Brewery List</a>
            </li>
            <li>
                <a href="#BuildURL( action='beer.list' )#">Beer List</a>
            </li>

             <li>
                <a href="#BuildURL( action='menu.list' )#">Menu List</a>
            </li>
        </ul>
    </div>
</cfoutput>