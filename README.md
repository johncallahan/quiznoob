[quiznoob](https://github.com/johncallahan/quiznoob-flutter) is an app that kids can use to earn more Internet time by answering quiz questions.  You must have:

* A [Circle](https://meetcircle.com/) device by Disney (~ $100 USD)
* A **free** [IFTTT](https://ifttt.com/discover) (if-THIS-then-THAT) account

Kids earn :hearts: (hearts) for answering quiz questions they can redeem for extra Internet time via Circle's [integration with IFTTT](https://medium.com/building-circle/ask-alexa-about-your-circle-and-pause-ae3fdbba9a50). See [this Medium article](https://medium.com/@johnrcallahan/quiznoob-earn-while-you-learn-a31efb110a84) and [this Youtube video](#) about quiznoob!


# Quick Start

*  [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# Installation

To install the server on your local machine first as a test, make sure you have ruby 2.2, Rails4 and MySQL (the default database) installed, then:

```
% git clone https://github.com/johncallahan/quiznoob.git
% cd quiznoob
% bundle install
% bundle exec rake db:create
% bundle exec rake db:migrate
% bundle exec rake db:seed
```

After the server starts, visit http://localhost:3000/ and login with the admin@example.com and password 'adminpassword'.  Click the “New User” button to create a user. The access token will be needed on the child’s quiznoob mobile app. Next, you will need to upload some quiz materials. There are some quizzes in the data directory of the github project as Excel files (data/qn_mathematics_9x.xlsx). Click on the “Questions” tab, select “Choose file” and click the “Import” button.

Although a quiz was automatically created when you imported the questions, you must create and assign the quiz to a subject. Click on the “Subjects” tab and then the “New Subject” button. Create a subject like “Mathematics” with a description and click the “Create Subject” button.  Finally, navigate to the Quiz tab, enable the “Multiply by 9” quiz and assign it to the “Mathematics” subject in the pull-down list.  This is the miminal setup needed for the mobile app to connect and operate. Later, we’ll configure rewards and integrate with IFTTT and Circle.

# Mobile app

* [Click here for the client app source code](https://github.com/johncallahan/quiznoob-flutter) or via the App and Play stores (coming soon).

The mobile application is built with flutter, a fantastic cross-platform tool for developing Android and iOS apps from a single codebase. The quiznoob-flutter source code is on github. You must first install Xcode, Android Studio and flutter on your computer. Make sure flutter is on your path. Then, clone the project, fix the flutter packages, start an iOS simulator, and run the app:

```
% git clone https://github.com/johncallahan/quiznoob-flutter.git
% flutter doctor
% open -a Simulator.app
% flutter run
```

You may have issues with your provisioning profile in which case you’ll need to open Xcode and create provisioning profile for the app. Follow instructions in the flutter documentation and tool instructions. They are very helpful. Click on the ð to move to the next question. Notice that your ❤️  count increased too. You will need these points for rewards. Try to skip a question, answer incorrectly, change your answer, etc. You can exit a quiz at anytime by clicking the ⬅️  button or the ❤ ️ count. My children helped design the flow of the app. I thought that you should be awarded points only if you finished a quiz with 7/10 questions answered correctly, but my children said that you should earn points immediately for each correct answer and be able to cash in your hearts as soon as you reach the cost of a reward. They were right! Complete the quiz, click on the final ❤️  and return to the list of Mathematics quizzes.

# Contact

* [Signup for development information about quiznoob](http://eepurl.com/djo9nD)!

# Licenses

[![Build Status](https://travis-ci.org/johncallahan/quiznoob.svg?branch=master)](https://travis-ci.org/johncallahan/quiznoob) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)