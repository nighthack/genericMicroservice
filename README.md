# Sinatra Microservice Template

Microservice Layer for small apps built on Sinatra

> Prerequisites
  >- [Mongodb local](https://docs.mongodb.com/manual/installation/)
  OR
  >- Docker


### Run the Application

1. Setup the application
```
bundle install
```

2. Run the application
```
bundle exec rackup -p 8006
```

3. Run as Docker Image
```
docker compose up
```

> Development
4. Run the application with live reload
```
rerun puma
# or
rerun rackup
```

### Run in production / staging

1. Ensure your environment is setup in config/mongoid.yml
2. Setup config specifics in docker-compose.yml
3. Run Docker


### Docs

[Postman Collection]()


CRUD on user resource as default, add your own lib
```ruby
  #POST /users
  # ADD a new user
{
    "name": "Vishrut Jha",
    "phone": "8431091924",
    "balance": 4500,
    "profile": "Techie"
}
