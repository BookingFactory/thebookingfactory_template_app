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

class WebsiteApplication < Sinatra::Base
  set :s3_url, "https://buuqit-test.s3.amazonaws.com/"

  before do
    load_drop
  end

  ["/terms_and_conditions", "/:lang/terms_and_conditions"].each do |route|
    get route do
      liquid :terms_and_conditions, :locals => { :website_data => @drop }
    end
  end

  ["/privacy-policy", "/:lang/privacy-policy"].each do |route|
    get route do
      liquid :privacy_policy, :locals => { :website_data => @drop }
    end
  end

  ["/about", "/:lang/about"].each do |route|
    get route do
      liquid :about_page, :locals => { :website_data => @drop }
    end
  end

  ["/faq", "/:lang/faq"].each do |route|
    get route do
      liquid :faq_page, :locals => { :website_data => @drop }
    end
  end

  ["/contacts", "/:lang/contacts"].each do |route|
    get route do
      liquid :contact_page, :locals => { :website_data => @drop }
    end
  end

  ["/blog", "/:lang/blog"].each do |route|
    get route do
      liquid :blog_page, :locals => { :website_data => @drop }
    end
  end

  ["/gallery", "/:lang/gallery"].each do |route|
    get route do
      liquid :gallery_page, :locals => { :website_data => @drop }
    end
  end

  ["/membership", "/:lang/membership"].each do |route|
    get route do
      liquid :membership_page, :locals => { :website_data => @drop }
    end
  end

  ["/book", "/:lang/book"].each do |route|
    get route do
      liquid :book_page, :locals => { :website_data => @drop }
    end
  end

  ["/", "/:lang"].each do |route|
    get route do
      liquid :index, :locals => { :website_data => @drop }
    end
  end

  not_found do
    liquid :not_found_page
  end

  private

  def load_hotel_and_data
  end

  def load_drop
    @drop = WebsiteDataDrop.new
  end

end
