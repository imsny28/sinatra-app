# first of all Create and run Sinatra Application on your local machine

## This is not good, need to find a better solution! For m1 mac mini

```
gem install eventmachine -- --with-openssl-dir=/opt/homebrew/opt/openssl@1.1
```

```
bundle install
```

```
rackup -p 8080
```

View at: http://localhost:8080

# Run the Sinatra Application using Docker

```
docker compose up
```

View at: http://localhost:8080
