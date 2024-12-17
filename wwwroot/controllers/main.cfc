
component accessors="true" {

    property menuService; // Dependency Injection in action!

    public any function init ( fw ) {
        variables.fw = fw;
        return this;
    }
    
    public void function default ( rc ) {
         variables.data = {
            nome = "João",
            idade = 30,
            email = "joao@email.com",
            endereco = "Rua ABC, 123"
        };
        //O dashboard é padrão
        rc.subtitle = "Dashboard";
        
        rc.menus = menuService.getAllMenus();

        // Passa a estrutura para o request/contexto (rc)
        rc.viewData = variables.data;
        
       // cfdump( var=rc.menus, label="Dados Menu" );
    
    }

}