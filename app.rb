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

Dir.glob("./liquid_filters/*.rb") do |filter|
  require "#{filter}"
end

Dir.glob("./models/*.rb") do |model|
  require "#{model}"
end

Dir.glob("./liquid_drops/*.rb") do |drop|
  require "#{drop}"
end

get "/" do
  #here we can pass data to load necessary website
  drop = WebsiteDataDrop.new

  liquid :index, :locals => { :website_data => drop }
end
