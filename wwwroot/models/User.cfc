<cfcomponent>

    <!--- Função para obter um usuário pelo ID --->
    <cffunction name="getUserById" access="public" returntype="struct">
        <cfargument name="userId" type="numeric" required="true">
        
        <cfquery name="qryGetUser" datasource="PostgreSQL_DataSource">
            SELECT * FROM users WHERE id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn qryGetUser>
    </cffunction>

</cfcomponent>
