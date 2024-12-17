component displayname="product controller"  accessors="true" {

    property menuService; // Dependency Injection in action!
    property productService; // Dependency Injection in action!
    property productColumnsService; // Dependency Injection in action!

    public any function init ( fw ) {
        variables.fw = fw;
        return this;
    }
    
    public void function default ( rc ) {
        variables.fw.redirect( action='product.list', append='none');

        rc.menus = menuService.getAllMenus();
    }
    
    public void function list ( rc ) {
        
        rc.productSubtitle = "Product List";

        rc.products = productService.getAllproducts();

        rc.subtitle = "Product";

        rc.menus = menuService.getAllMenus();


    }
    
    public void function add ( rc ) {
        rc.productId = 0;
        rc.subtitle = 'Add product';
        var productName = rc.productName;
        var productDescription =  rc.productDescription;
        var productPrice =  rc.productPrice;
        var productPrice =  rc.productQuantity;

         writeDump(var=rc, label="Request Context", abort=true);

        // Valida se o campo foi preenchido
        if (len(productName)) {
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