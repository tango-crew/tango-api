# Tango API

[![Build Status](https://travis-ci.org/tango-crew/tango-api.svg?branch=master)](https://travis-ci.org/tango-crew/tango-api)
[![Code Climate](https://codeclimate.com/github/tango-crew/tango-api/badges/gpa.svg)](https://codeclimate.com/github/tango-crew/tango-api)
[![Test Coverage](https://codeclimate.com/github/tango-crew/tango-api/badges/coverage.svg)](https://codeclimate.com/github/tango-crew/tango-api/coverage)
[![Dependency Status](https://gemnasium.com/tango-crew/tango-api.svg)](https://gemnasium.com/tango-crew/tango-api)

This project is a [Rails](http://rubyonrails.org/) application used as an API to Tango.

## Dependencies

To run this project you need to have:

* Ruby 2.3.0 - You can use [RVM](http://rvm.io)
* [PostgreSQL](http://www.postgresql.org/)
  * OSX - [Postgress.app](http://postgresapp.com/)
  * Linux - `$ sudo apt-get install postgresql`

## Setup the project

1. Install the dependencies above
2. `$ git clone <REPOSITORY_URL> tango-api` - Clone the project
3. `$ cd tango-api` - Go into the project folder
4. `$ bin/setup` - Run the setup script
5. `$ bin/rspec` - Run the specs to see if everything is working fine

## Running the project

1. `$ bundle exec foreman start` - Opens the server
2. Open [http://localhost:3000](http://localhost:3000)

#### Running specs and checking coverage

`$ bundle exec rake spec` to run the specs.

`$ coverage=on bundle exec rake spec` to generate the coverage report then open the file `coverage/index.html` on your browser.

## Deploying the project to Heroku

:warning: This is the **ONLY RECOMMENDED WAY** to integrate this project, please do not push directly to Heroku.

All commits pushed to branch master will be deployed on the Heroku. It is did automatically by [Travis CI](https://travis-ci.org/tango-crew/tango-api).
For more details see the [documentation](http://docs.travis-ci.com/user/deployment/heroku/) and the **.travis.yml** file.

## How to contribute :heart_eyes:

Follow the [GitHub Flow](https://guides.github.com/introduction/flow/)
