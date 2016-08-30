require "sinatra"
require "sinatra/base"
require "sequel"
require "liquid"


DB = Sequel.postgres('buuqit',
  :user => 'buuqit_user',
  :password => 'buuqit_password',
  :host => 'localhost',
  :port => 5432
)

#DB = Sequel.connect('postgres://user:password@localhost/my_db')

Dir.glob("./helpers/*.rb") do |helper|
  require "#{helper}"
end

Dir.glob("./models/*.rb") do |model|
  require "#{model}"
end

Dir.glob("./models/liquid_drops/*.rb") do |drop|
  require "#{drop}"
end

get "/" do
  #here we can pass data to load necessary website
  drop = WebsiteDataDrop.new

  liquid :index, :locals => { :website_data => drop }
end
