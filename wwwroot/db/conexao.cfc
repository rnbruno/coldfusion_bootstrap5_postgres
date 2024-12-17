<cfcomponent>
    <!-- Configurações comuns -->
    <cfproperty name="datasource" default="postgres1_1" />

    <!-- Método para consultas -->
    <cffunction name="query" access="public" returnType="query">
        <cfargument name="sql" type="string" required="true">
        <cfargument name="params" type="struct" required="false" default="#StructNew()#">

        <cfscript>
            var result = "";
            try {
                // Executa a consulta
                result = queryExecute(arguments.sql, arguments.params, {datasource=variables.datasource});
            } catch (any e) {
                // Exibe a mensagem de erro caso algo falhe
                writeOutput("Erro ao executar consulta: " & e.message);
                abort;
            }
            return result;
        </cfscript>
    </cffunction>


    <cffunction name="onApplicationStart" returnType="boolean">
        <cfset application.menuModel = createObject("component", "../models.MenuModel")>
        <cfreturn true>
    </cffunction>

</cfcomponent>