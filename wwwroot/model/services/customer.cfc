component displayname="Customer service" accessors="true" {

    // alternate way of using Dependency Injection to load necessary objects
    public any function init ( helperService ) {
        variables.hs = helperService;
    }
    
    public query function getAllCustomers () {
        return queryExecute( 
           "SELECT  customer_id,
                    first_name,
                    last_name,
                    email,
                    phone,
                    address,
                    city,
                    postal_code,
                    estado,
                    country
            FROM customer
            WHERE deleted = 0 OR deleted IS NULL 
            ORDER BY first_name"
        ); 
    }
    
    public query function getCustomer ( required numeric id ) {
        return queryExecute( 
           "SELECT   customer_id,
                    first_name,
                    last_name,
                    email,
                    phone,
                    address,
                    city,
                    postal_code,
                    country
            FROM customer
            WHERE id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } } // equivalent to <cfqueryparam>
        );
    }
    
    public numeric function save ( numeric id = 0, string name = '', string description='',
          string price = '', string quantity = '' ) {

        //     writeDump(var="rc", label="Request Context", abort=true);

        var customerExists = getcustomer( id ).recordcount;
        if ( arguments.id > 0 && customerExists ) {
            queryExecute(
               "UPDATE customer
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
               "INSERT INTO customer
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
            "UPDATE customer set deleted = 1 WHERE id = :id",
            { id={ value=arguments.id, cfsqltype='integer' } }
        );
    }

    public query function getAllCustomersColumns () {
        var customer = 'customer';
        return queryExecute( 
            "SELECT  id,              
                    name,         
                    description,                   
                    price,      
                    quantity,             
                    created_at, 
                    updated_at 
            FROM customer
            ORDER BY name"

        ); 
    }
}