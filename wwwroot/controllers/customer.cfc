component displayname="customer controller"  accessors="true" {

    property menuService; // Dependency Injection in action!
    property customerService; // Dependency Injection in action!
    property customerColumnsService; // Dependency Injection in action!
    property cidadeService; // Dependency Injection in action!
    property estadoService; // Dependency Injection in action!

    public any function init ( fw ) {
        variables.fw = fw;
        return this;
    }
    
    public void function default ( rc ) {
        variables.fw.redirect( action='customer.list', append='none');

        rc.menus = menuService.getAllMenus();
    }
    
    public void function list ( rc ) {
        
        rc.customerSubtitle = "Customer List";

        rc.customers = customerService.getAllCustomers();

        rc.cidades = cidadeService.getAllCidades()

        rc.estados = estadoService.getAllEstados()

        rc.subtitle = "Customer";

        rc.menus = menuService.getAllMenus();


    }
    
    public void function add ( rc ) {
        rc.customerId = 0;
        rc.subtitle = 'Add customer';
        var customerFirstName = rc.customerFirstName;
        var customerLastName = rc.customerLastName;
        var customerEmail = rc.customerEmail;
        var customerPhone = rc.customerPhone;
        var customerAddress = rc.customerAddress;
        var customerCity = rc.customerCity;
        var customerPostalCode = rc.customerPostalCode;
        var customerEstados =  rc.customerEstados;
        var customerDescription =  rc.customerDescription;
        var customerCountry =  rc.customerCountry;  

         writeDump(var=rc, label="Request Context", abort=true);

        // Valida se o campo foi preenchido
        if (len(customerFirstName)) {
            // Chama a camada de serviço para salvar o produto
            var productService = application.serviceFactory.getService("product");
            productService.saveProduct( productName );

            // Define mensagem de sucesso
            rc.message = "Product successfully added!";
        } else {
            rc.message = "Product name is required.";
        }

        // Redireciona ou exibe a resposta
        redirect( url=BuildURL(action="product.list") );

    }
    
    public void function edit ( rc ) {
        
        if ( StructKeyExists( rc, 'productId' ) && rc.productId > 0 ) {
            var product = productService.getproduct( rc.productId );
            rc.productName = product.name;
            rc.productDescription = product.Description;
            rc.productPrice = product.Price;
            rc.productQuantity = product.Quantity;
        }
        rc.subtitle = 'Edit product';
    }
    
    public void function save ( rc ) {

        rc.productId = 0;
        rc.productId = productService.save( rc.productId, rc.name,
            rc.description, rc.price, rc.quantity);
            
        rc.subtitle = 'Edit product';
        variables.fw.redirect( action='product.list', append='productId');
    }
    
    public void function delete ( rc ) {

        if ( StructKeyExists( rc, 'productId' ) && rc.productId > 0 ) {
            productService.delete( rc.productId );
        }
        variables.fw.redirect( action='product.list', append='none');
    }
}