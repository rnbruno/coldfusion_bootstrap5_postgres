component displayname="Menu controller"  accessors="true" {

    property menuService; // Dependency Injection in action!

    public any function init ( fw ) {
        variables.fw = fw;
        return this;
    }
    
    public void function default ( rc ) {
        variables.fw.redirect( action='menu.list', append='none');
    }
    
    public void function list ( rc ) {
        rc.menus = menuService.getAllMenu();
        rc.subtitle = "Menu List";
    }
    
    public void function list2 ( rc ) {
        rc.breweries = [
            { id = 1, name = "Brewery One" },
            { id = 2, name = "Brewery Two" }
        ];
        rc.subtitle = "Brewery List";
    }
}