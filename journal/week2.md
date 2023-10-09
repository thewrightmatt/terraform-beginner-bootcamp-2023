# Terraform Beginner Bootcamp 2023 - Week 2

## Table of Contents

## Working with Ruby

### Bundler
Bundler is a package manager for Ruby. It is the primary way to install ruby packages that are known as 'gems'.

#### Install Gems
You need to create a Gemfile and define your gems in that file.
```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command and this will install the gems on the system globally (unlike nodejs which installs packages in a place in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the context of bundler
We have to use `bundle exec` to tell future reuby scripts to use gems we installed. This is the way we set context.

#### Sinatra
Sinatra is a micro web-framework for ruby to build web-apps. Great ofr mock or development servers or just simple projects. Single file webserver
- https://sinatrarb.com

## Terratowns Mock Server

### Running the Web Server
We can run the web server by executing the following commands:
```rb
bundle install
bundle exec ruby server.rb
```

All of the code for the server is stored in the 'server.rb' file
