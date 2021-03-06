# api_web_server

This application provides a basic environment that can be extended to develop a Ruby on Rails API web server.
An authentication layer is implemented and it is based on [devise](https://github.com/plataformatec/devise) and [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth). 
If you need to restrict access to actions of specific controller, it should extends ```RestrictedController```.
To get access to restricted actions the header request must include the following parameters
  - access-token
  - uid
  - client

plus ```application/json``` as Content-type.
  
You can find the relative values in the response header after performing the login through a POST request to /auth/sign_in
with parameters 
```{"email":"user@example.com","password":"password"}``` plus ```application/json``` as Content-type.

### Installation

Clone the repository.

Rename the app.

```
$ rails g rename:app_to New-Name
```

create your own ```config/database.yml``` and ```config/secrets.yml```

Run:

```
$ rake db:setup
$ rails s
```
### Production

Remember to properly configure the app editing ```config/initializer/devise_token_auth.rb``` and ```config/application.rb``` at the line: 
```
config.middleware.use Rack::Cors do 
    # Your configurations
end
```
as suggested [here](https://github.com/lynndylanhurley/devise_token_auth#cors). You should consider to use [j-toker](https://github.com/lynndylanhurley/j-toker) to perform your requests and [Apipie](https://github.com/Apipie/apipie-rails) to document your APIs.
