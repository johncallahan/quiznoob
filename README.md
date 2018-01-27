# Rails-React-Auth

[![Build Status](https://travis-ci.org/johncallahan/quiznoob.svg?branch=master)](https://travis-ci.org/johncallahan/quiznoob)

This app is still in the work, but it has a complete Auth system that is ready to be used against client apps.
Once you register from the client app you will receive an access_token. There is also a verify_access_token in the Session controller method so you can use it to verify the access_tokens.
You may watch the first part of my tutorial where I explain how the Rails backend works in this link. https://www.youtube.com/watch?v=ZpiF5IhavaY

# Setup

1. Clone the repository
2. Install required gems via `bundle install`
3. Update database credentials in `config/database.yml`
3. Setup database
  1. `rake db:create`
  2. `rake db:schema:load`
  3. `rake db:migrate`

# Development

* Run project `rails server`
* Navigate to `localhost:3000` to see it working!
