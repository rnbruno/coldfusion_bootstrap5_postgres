
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
                    <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="##addProductModal">Add Product</button>
                    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <form action="#BuildURL( action='product.save' )#" method="post">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Product</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="recipient-name" class="col-form-label">Name:</label>
                                                <input type="text" class="form-control" name="name" id="name">
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label">Description:</label>
                                                <textarea class="form-control" name="description" id="description"></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label">Price:</label>
                                                <input type="text" class="form-control" name="price" id="price">
                                            </div>
                                            <div class="mb-3">
                                                <label for="message-text" class="col-form-label">Quantity:</label>
                                                <input type="number" class="form-control" name="quantity" id="quantity">
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" name="Submit" class="btn btn-primary">Save Product</button>
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

            <h3>#rc.productSubtitle#</h3>
            <div class="table-responsive">
                <table class="table table-striped table-sm" id="products">
                    <thead>
                        <tr>
                            <th scope="col"></th>   
                            <th scope="col">Header</th>
                            <th scope="col">Header</th>
                            <th scope="col">Header</th>
                            <th scope="col">Header</th>
                            <th scope="col">Header</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <tr>
                            <td>1,001</td>
                            <td>random</td>
                            <td>data</td>
                            <td>placeholder</td>
                            <td>text</td>
                            <td>text</td>
                        </tr>
                        <cfloop query="rc.products">
                            <tr>
                                <td>#rc.products.name#</td>
                                <td>#rc.products.description#</td>
                                <td>#rc.products.price#</td>
                                <td>#rc.products.quantity#</td>
                                <td>#rc.products.created_at#</td>
                                <td> <button type="button" onclick="productDelete(#rc.products.id#)" class="btn btn-sm btn-danger">Delete Product</button></td>
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
            $('##products').DataTable();

            function productDelete(id){
           
                console.log(id);

                // Construir a URL dinamicamente com o `id` fornecido
                var deleteUrl = "#BuildURL(action='product.delete')#&productId=" + id;
                $.get({
                    url: deleteUrl,
                    method: "POST", 
                    success: function (response) {
                        alert("Product deleted successfully!");
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