== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* REQUIREMENTS FOR DEPLOYMENT

* Follow this for RVM based deployment https://gorails.com/deploy/ubuntu/14.04
* Need to install nginx from phusion passenger repo (not stock ubuntu repo)
* Need javascript backend (sudo apt-get install nodejs, works)
* To avoid capistrano deployment:
** Set rails env to production; adding "export RAILS_ENV=production" to .bashrc on deployment user works
** Need to fill-in settings.yml and secrets.yml file. Latter benefits from running "rake secret"
** Need to run db migration /creation; "rake db:create" should work
** Should precompile assets for speed "rake assets:precompile"
* Example IP restricted nginx conf file for rails app: http://stackoverflow.com/questions/8438867/how-can-i-allow-access-to-a-single-ip-address-via-nginx-conf

