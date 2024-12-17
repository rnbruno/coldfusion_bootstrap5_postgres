component extends="framework.one" {

    function setupApplication() { }

    function setupEnvironment( env ) { }

    function setupSession() { }

    function setupRequest() {
        // use setupRequest to do initialization per request
        request.context.startTime = getTickCount();
    }

    function setupResponse( rc ) { }

    function setupSubsystem( module ) { }

    function setupView( rc ) { }

    function before( struct rc ) {
        rc.appSettings = {
            h1Title : 'FW/1 MVC App',
            title : 'FW/1 MVC Demo'
        };
    }

    public string function formatPrice (any value) {
        return "$" & numberFormat(value, "0.00");
    }

    public string function headNav (any value) {

        // writeDump(var=value, label="Valor da consulta rc.menus", abort=true);

        var output = "";

        // Começar a estrutura HTML do menu
        output &= '<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">';
        output &= '<div class="position-sticky pt-3">';
        output &= '<ul class="nav flex-column">';

        
        // Verifique se a consulta rc.menus está disponível
        if ( value.recordCount > 0) {

                
            // Loop para adicionar os itens de menu usando CFScript
            for (var i = 1; i <= value.recordCount; i++) {
                var id = value.ID[i];
                var name = value.NAME[i];
                var menu = value.MENU[i];
                var url = value.URL[i];
                var icon = value.ICON[i];
               
                // Verificar se é o primeiro item (ativo) "#BuildURL(action='##rc.menus.url#.list')"
                if (i == 1) {
                    output &= "<li class='nav-item'>";
                    output &= "<a class='nav-link active' aria-current='page' href='#BuildURL(url & '.list' )#'>";
                    output &= "<span data-feather='home'></span>";
                    output &= name;
                    output &= "</a>";
                    output &= "</li>";
                } else {
                    // Outros itens de menu
                    output &= "<li class='nav-item'>";
                    output &= "<a class='nav-link' href='#BuildURL(url & '.list' )#'>";
                    output &= "<span data-feather='shopping-cart'></span>";
                    output &= name;
                    output &= "</a>";
                    output &= "</li>";
                }
            }
        }else{
            writeDump(var="Else", label="Valor da consulta rc.menus", abort=true);
        }


        // Finalizar o menu
        output &= '</ul>';
        output &= '</div>';
        output &= '</nav>';

        return output;
    }
}
