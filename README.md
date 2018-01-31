# quiznoob

[![Build Status](https://travis-ci.org/johncallahan/quiznoob.svg?branch=master)](https://travis-ci.org/johncallahan/quiznoob)

[quiznoob](https://github.com/johncallahan/quiznoob-flutter) is an app that kids can use to earn more Internet time by answering quiz questions.  You must have:

* A Circle device by Disney
* An IFTTT (if-THIS-then-THAT) account

Kids earn :hearts: (hearts) for answering quiz questions they can redeem for 

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
