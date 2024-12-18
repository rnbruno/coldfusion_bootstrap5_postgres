component displayname="Cidade service" accessors="true" {

    // alternate way of using Dependency Injection to load necessary objects
    public any function init ( helperService ) {
        variables.hs = helperService;
    }
    
    public query function getAllCidades () {
        return queryExecute( 
           "SELECT  id,
                    nome,
                    id_estado,
                    capital,
                    codigo,
                    status
            FROM cidade
            WHERE deleted = '0' OR deleted IS NULL 
            ORDER BY id"
        ); 
    }
    
    public query function getCidade ( required numeric id ) {
        return queryExecute( 
           "SELECT   id,
                    nome,
                    id_estado,
                    capital,
                    codigo,
                    status
            FROM cidade
            WHERE id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } } // equivalent to <cfqueryparam>
        );
    }
    
    public numeric function save ( numeric id = 0, string name = '', string description='',
          string price = '', string quantity = '' ) {

        //     writeDump(var="rc", label="Request Context", abort=true);

        var cidadeExists = getcidade( id ).recordcount;
        if ( arguments.id > 0 && cidadeExists ) {
            queryExecute(
               "UPDATE cidade
                SET name = :name
                    ,description = :description
                    ,price = :price
                    ,quantity = :quantity
                WHERE id = :id",
                {
                    id = { value = arguments.id, cfsqltype = 'integer'},
                    name = { value = arguments.name, 
                        null = hs.isEmptyString( arguments.name ), cfsqltype = 'varchar' },
                    description = { value = arguments.description, 
                        null = hs.isEmptyString( arguments.description ), cfsqltype = 'varchar' },
                    price = { value = arguments.price, 
                        null = hs.isEmptyString( arguments.price ), cfsqltype = 'integer' },
                    quantity = { value = arguments.quantity, 
                        null = hs.isEmptyString( arguments.quantity ), cfsqltype = 'integer' }
                }
            );
            return arguments.id;
        }
        else if ( arguments.id == 0 ){
            var result = '';
            result = queryExecute(
               "INSERT INTO cidade
                ( name, description, price, quantity )
                VALUES ( :name, :description, :price, :quantity ) RETURNING id",
                {
                    name = { value = arguments.name, 
                        null = hs.isEmptyString( arguments.name ), cfsqltype = 'varchar' },
                    description = { value = arguments.description, 
                        null = hs.isEmptyString( arguments.description ), cfsqltype = 'varchar' },
                    price = { value = arguments.price, 
                        null = hs.isEmptyString( arguments.price ), cfsqltype = 'numeric' },
                    quantity = { value = arguments.quantity, 
                        null = hs.isEmptyString( arguments.quantity ), cfsqltype = 'integer' }
                },
                { result = 'result'}
            );
            // Access the first row of the result and retrieve the 'id'
            if ( result.recordCount > 0 ) {
                return result.id;  // Acessando a coluna 'id' diretamente
            } else {
                return "No ID returned from the query."; // Caso não haja retorno
            }
            return result.generatedkey;
        }
    }
    
    public void function delete ( required numeric id ) {
        queryExecute( 
            "UPDATE cidade set deleted = 1 WHERE id = :id",
            { id={ value=arguments.id, cfsqltype='integer' } }
        );
    }

    public query function getAllCidadesColumns () {
        var cidade = 'cidade';
        return queryExecute( 
            "SELECT  id,              
                    name,         
                    description,                   
                    price,      
                    quantity,             
                    created_at, 
                    updated_at 
            FROM cidade
            ORDER BY name"

        ); 
    }
}