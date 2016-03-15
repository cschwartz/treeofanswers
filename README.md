## README

[![Build Status](https://travis-ci.org/cschwartz/treeofanswers.svg?branch=master)](https://travis-ci.org/cschwartz/treeofanswers)

To get stated:

  * Clone this repository
  * Run `bundle install` to install ruby dependencies
  * Run `npm install bower -g && npm install` to install (frontend) js dependencies
  * Migrate the database via 'bin/rake db:migrate'
  * Prepare the test database using 'bin/rake db:test:prepare'
  * Run the specs to ensure everything is working as intended using `bin/rake spec`
  * Start a dev server using 'bin/rails s' and take a look at *localhost:3000`
