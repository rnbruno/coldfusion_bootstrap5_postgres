component displayname="Menu service" accessors="true" {

    // alternate way of using Dependency Injection to load necessary objects
    public any function init ( helperService ) {
        variables.hs = helperService;
    }
    public query function getAllMenus () {
        return queryExecute( 
           "SELECT  menu.id
                    ,menu.name
                    ,menu.name AS menu
                    ,menu.url
                    ,menu.icon
                    ,menu.order_
            FROM Menus menu
            WHERE is_active = true
            ORDER BY menu.name ASC"
        ); // queryExecute equivalent to <cfquery>
    }
    
    public query function getMenu ( required numeric id ) {
        return queryExecute( 
           "SELECT  menu.id
                    ,menu.name
                    ,menu.name AS menu
                    ,menu.url
                    ,menu.icon
                    ,menu.order_
            FROM Menu menu
            WHERE id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } } 
            // equivalent to <cfqueryparam>
        );
    }
    
   
   
}