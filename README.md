# Tea Time


### Abstract
This back-end application manages subscriptions for a tea delivery service. Utilizing RESTful routes, a front-end application may create, update, and view a customer's subscriptions.


### Built With
![Ruby](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white)
![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)




## Example responses and requests
### Create subscription
POST /api/v1/subscriptions
Params
{
    title: string
    price: float
    status: string
    frequency: string
    customer_id: integer
    "tea": {
           "title": string
           "description": string
           "temperature": integer
           "brew_time": integer
           }
}
```
Response
```json
{
    "data": {
        "type": "subscription",
        "id": 1,
        "attributes": {
            "title": "Tea",
            "price": 9.99,
            "status": "active",
            "frequency": "Monthly",
            "customer_id": 1,
            "tea": {
                "title": "Black Tea",
                "description": "It's a tea",
                "temperature": 165,
                "brew_time": 6
            }
        }
    }
}
```

### Edit subscription
PATCH /api/v1/subscriptions/:id
Params
{
  "id": integer
  "title": string
  "price": float
  "status": string
  "frequency": string
  "customer_id": integer
}
```
Response
```json
{
    "data": {
        "type": "subscription",
        "id": 1,
        "attributes": {
            "title": "Tea",
            "price": 9.99,
            "status": "inactive",
            "frequency": "Monthly",
            "customer_id": 1,
            "tea": {
                "title": "Black Tea",
                "description": "It's a tea",
                "temperature": 165,
                "brew_time": 6
            }
        }
    }
}
```

### View Customer's subscriptions
GET /api/v1/subscriptions
Params
{
  "id": integer,
  "title": string
  "price": float
  "status": string
  "frequency": string
  "customer_id": integer
}
```
Response
```json
{
    "data": [
        {
            "type": "subscription",
            "id": 1,
            "attributes": {
                "title": "Tea",
                "price": 9.99,
                "status": "inactive",
                "frequency": "Monthly",
                "customer_id": 1,
                "tea": {
                    "title": "Black Tea",
                    "description": "It's a tea",
                    "temperature": 165,
                    "brew_time": 6
                }
            }
        },
        {
            "type": "subscription",
            "id": 2,
            "attributes": {
                "title": "Tea",
                "price": 9.99,
                "status": "active",
                "frequency": "Monthly",
                "customer_id": 1,
                "tea": {
                    "title": "Black Tea",
                    "description": "It's a tea",
                    "temperature": 165,
                    "brew_time": 6
                }
            }
        }
    ]
}
```


 

