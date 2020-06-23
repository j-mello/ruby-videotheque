# After cloning the repo
```
docker-compose exec app yarn install --check-files
```

# Create migration
```
docker-compose exec app rails generate migration CreatePost title:string content:text timestamps
```

# Run migration
```
docker-compose exec app rails db:migrate
```

# Rollback migration
```
docker-compose exec app rails db:rollback
```

# Console
```
docker-compose exec app rails console
```

# Create a resource
```
mypost = Post.new(title: "article 1", content: "contenu de l'article 1")
mypost.save
```

OR

```
Post.create(title: "article 1", content: "contenu de l'article 1")
```

# Show routes
```
docker-compose exec app rails routes
```

# Add column
```
docker-compose exec app rails generate migration AddStatusToPost status:boolean
```


# Generate Scaffold
```
docker-compose exec app rails generate scaffold Comment name:string message:text post:belongs_to
```
