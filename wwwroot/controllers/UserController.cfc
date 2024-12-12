<cfcomponent>

    <!--- Função para exibir o perfil de um usuário --->
    <cffunction name="showUserProfile" access="public" returntype="void">
        <cfargument name="userId" type="numeric" required="true">
        
        <!--- Instancia o modelo de usuário --->
        <cfset userModel = createObject("component", "models.User")>

        <!--- Obtém os dados do usuário pelo ID --->
        <cfset userData = userModel.getUserById(arguments.userId)>

        <!--- Passa os dados do usuário para a visualização --->
        <cfinclude template="/views/userProfile.cfm">
    </cffunction>

</cfcomponent>
