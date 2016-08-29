require "sinatra"
require "sequel"
require "liquid"

DB = Sequel.postgres('buuqit',
  :user => 'buuqit_user',
  :password => 'buuqit_password',
  :host => 'localhost',
  :port => 5432
)

Dir.glob("./models/*.rb") do |rb_file|
  require "#{rb_file}"
end


get "/" do
  "Website engine app"
end
