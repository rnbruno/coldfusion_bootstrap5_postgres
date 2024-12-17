<!---
<cfset menuModel = createObject("component", "models.MenuModel")>

 Chamar a função do Model para obter os menus --->
<!---
<cfset menus = menuModel.getMenus()>

<!--- Tornar a variável menus global, para que possa ser acessada no index.cfm --->
<cfset application.menus = menus>

<!--- Passa os dados para o template 'index.cfm' 
<cfinclude template="index.cfm">
--->
--->
<!--- Dentro de controller.cfm --->
<!--- Armazenar no escopo request para usar no controller 
<cfset menus = getTodosMenus>
--->

<!--- Incluir o controller que usará a variável 
<cfinclude template="index.cfm">
--->



<cfscript>
    // Função responsável por buscar os menus
    function getMenusForView(item) {
        // Acessa o modelo global instanciado no Application.cfc
        return application.menuModel.getMenus1(item=item);
    }
</cfscript>

<!---
<cfdump var="#getTodosMenus#" label="Menus no Controller">
