require 'rubygems'
require 'bundler'
require 'nokogiri'
require 'socket'
require 'pp'
require 'json'
require 'uri'
require 'active_record'
require 'active_support'
require 'active_support/core_ext'
require 'open-uri'
require 'open_uri_redirections'
require 'mechanize'
require 'selenium-webdriver'
require 'date'
require 'time'

dbname = "taberogu_info"
host = 'localhost'
user = 'root'
pass = ""
ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :charset => 'utf8mb4',
  :encoding => 'utf8mb4',
  :collation => 'utf8mb4_general_ci',
  :database => dbname,
  :host     => host,
  :username => user,
  :password => pass
)

Time.zone_default =  Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

class TaberoguInfo < ActiveRecord::Base
end
