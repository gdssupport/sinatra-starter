#Setup environment
require 'bundler/setup'
require 'dotenv'
Dotenv.load

#Require Dependsencies
require "sinatra/base"
require "sinatra/activerecord"
require "sinatra/flash"
require "will_paginate"
require 'will_paginate/active_record'
require "will_paginate-bootstrap"

#Require Helpers
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file }

#Require Models
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

#Require Routes
Dir[File.dirname(__FILE__) + '/routes/*.rb'].each {|file| require file }

class MyApplication < Sinatra::Base

  #Register Extensions
  register Sinatra::Flash
  register WillPaginate::Sinatra
  register Sinatra::Auth
  helpers  Sinatra::Formatting::Helpers

  #Configure Sinatra
  set :root,      File.dirname(__FILE__)
  set :sessions,  true
  set :session_secret, '47fcef80c1d038d1e279c0eb3b684932'



  #Configure Development
  configure :development do
    require 'pry'
  end

end
