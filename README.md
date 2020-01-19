# Eat-it Api

### Overview
1. [Base URL](#base-url)
1. [Authorization overview](#authorization-overview)
1. [User](#user)
1. [Login](#login)
1. [Log out](#log-out)
1. [Meal](#meal)

### Base URL
Staging endpoint: ``` localhost:3000 ```

### Authorization overview
Authorization is based on JWT tokens. Each json token will expire after 24 hours of authorization. After hitting the log out endpoint JWT will be blacklisted and can't be used anymore. 

To log in you need to provide user credentials with proper email and password. In response ```Authorization``` headers you will receive valid JWT which now can be include into next request headers.

To call API add headers  

``` Content-Type: application/json ```

And if endpoint requires authentication:  

``` Authorization: Bearer your-jwt-token ```

If you make CORS request, you should also add:

``` Accept: application/json ```  

### Endpoints lists

#### User

**URI:** /api/v1/users/registrations   
**METHOD:** POST  
**PARAMS:**  
```
{
  "user": {
    "email": "example@email.com",
    "password": "passwordexample",
    "role": 1
  }
}
```
**RESPONSE:**  
Status: 200  
```
{
    "description": "User created successfully",
    "content": {
        "user": {
            "id": 6,
            "name": null,
            "surname": null,
            "nick": null,
            "age": null,
            "phone_number": null,
            "created_at": "2020-01-19T12:53:56.495Z",
            "updated_at": "2020-01-19T12:53:56.495Z",
            "email": "exampleuser@example.com"
        }
    }
}
```

Status: 422  
```
{
  "description": "Invalid inputs"
  "content": {
    "email": "can't be blank"
  }
}
```  

### Login

**URI:** /api/v1/users/sessions   
**METHOD:** POST  
**PARAMS:**  
```
{
    "user": {
        "email": "exampleuser@example.com",
        "password": "passwordpassword"
    }
}
```
**RESPONSE:**  
Status: 200  
```
{
    "status": "success",
    "description": "User successfully logged"
}
```

Status: 401
```
{
  description: "Invalid email or password."
}
```  
### Log out

**URI:** /api/v1/users/logout  
**METHOD:** DELETE  
**RESPONSE:** NO CONTENT  
Status: 204  

### Meal

**URI:** /api/v1/users/meals  
**METHOD:** GET  
**RESPONSE:**  
Status: 200  
```
{
    "status": "success",
    "description": "Return all meals",
    "content": {
        "meals": [
            {
                "id": 11,
                "name": "French Toast"
            },
            {
                "id": 12,
                "name": "Tuna Sashimi"
            },
            {
                "id": 13,
                "name": "Peking Duck"
            }
        ]
    }
}

```
---
**URI:** /api/v1/meals/:id  
**METHOD:** GET  
**RESPONSE:**  
Status: 200  
```
{
    "status": "success",
    "description": "Return requested meal",
    "content": {
        "meal": {
            "id": 14,
            "name": "Stinky Tofu",
            "recipe": "Breaded fried chicken with waffles. Served with maple syrup."
        }
    }
}

```
---
**URI:** /api/v1/meals  
**METHOD:** POST  
**PARAMS:**  
```
{
  "name": "Name",
  "recipe": "Recipe",
  "time": "60",
  "servings": "2"
}
```
**RESPONSE:**  
Status: 200  
NO CONTENT  

Status: 403
```
{
    "description": "Forbidden"
}
``` 
---
**URI:** /api/v1/meals/:id  
**METHOD:** POST  
**PARAMS:**  
```
{
  "name": "Name",
  "recipe": "Recipe",
  "time": "60",
  "servings": "2"
}
```
**RESPONSE:**  
Status: 200  
NO CONTENT  

Status: 403
```
{
    "description": "Forbidden"
}
``` 
---
**URI:** /api/v1/meals  
**METHOD:** DELETE  
**RESPONSE:**  
Status: 200  
NO CONTENT  

Status: 403
```
{
    "description": "Forbidden"
}
``` 
