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
        rc.productName = '';
        rc.productDescription = '';
        rc.productPrice = '';
        rc.productQuantity = '';
        rc.subtitle = 'Add product';
        variables.fw.setView( 'product.edit' );
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
        rc.productId = productservice.save( rc.productId, rc.productName,
            rc.productDescription, rc.productPrice, rc.productQuantity);
        rc.subtitle = 'Edit product';
        variables.fw.redirect( action='product.edit', append='productId');
    }
    
    public void function delete ( rc ) {
        if ( StructKeyExists( rc, 'productId' ) && rc.productId > 0 ) {
            productService.delete( rc.productId );
        }
        variables.fw.redirect( action='product.list', append='none');
    }
}