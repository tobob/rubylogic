## How to prepare database

```
bundle install
rake db:create
rake db:migrate
```

## Main form is accesible under root path

```
localhost:3000
```

unless you will change port binding

## Service that fetch N last unread Notifications is under name ReadingService with fetch method

example

```
ReadingService.fetch(x, {email: "sample@mail.com"})
```