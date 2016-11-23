require "sinatra"
require "sinatra/base"
require "liquid"
require "sinatra/json"
require "yaml"
require 'ostruct'

Dir.glob("./liquid_drops/*.rb") do |drop|
  require "#{drop}"
end

Dir.glob("./liquid_filters/*.rb") do |filter|
  require "#{filter}"
end

class Website < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, File.dirname(__FILE__) + '/views'
  set :public_folder, File.dirname(__FILE__) + "/views/assets"
  set :static, true

  before do
    data = OpenStruct.new(YAML.load_file("data.yml"))
    random = {
      :a => rand(1..9),
      :b => rand(1..9)
    }
    base = ''
    lang = 'en'
    @drop = WebsiteDataDrop.new(data, random, lang, base, request)
  end

  get "/" do
    liquid :index, :locals => { :website_data => @drop }
  end

  get "" do
    liquid :index, :locals => { :website_data => @drop }
  end

  get "/terms-and-conditions" do
    liquid :terms_and_conditions, :locals => { :website_data => @drop}
  end

  get "/privacy-policy" do
    liquid :privacy_policy, :locals => { :website_data => @drop }
  end

  get "/about" do
    liquid :about_page, :locals => { :website_data => @drop }
  end

  get "/faq" do
    liquid :faq_page, :locals => { :website_data => @drop }
  end

  get "/contacts" do
    liquid :contact_page, :locals => { :website_data => @drop }
  end

  get "/blog" do
    liquid :blog_page, :locals => { :website_data => @drop }
  end

  get "/blog_next" do
    liquid :blog_page, :locals => { :website_data => @drop }
  end

  get "/blog/:page" do
    current_record = BlogRecrodDrop.new(record.first)
    liquid :blog_record, :locals => { :website_data => @drop, :record => current_record }
  end

  get "/gallery" do
    liquid :gallery_page, :locals => { :website_data => @drop }
  end

  get "/membership" do
    liquid :membership_page, :locals => { :website_data => @drop }
  end

  get "/book" do
    liquid :book_page, :locals => { :website_data => @drop }
  end

  get "/number_page" do
    number_drop = NumberDrop.new(number)
    liquid :number, :locals => { :website_data => @drop, :number => number_drop }
  end

  get "/room_page" do
    room_drop = RoomDrop.new(room)
    liquid :other_room, :locals => { :website_data => @drop, :room => room_drop }
  end

  get "/custom_page" do
    page_drop = PageDrop.new(pages)
    liquid :custom_page, :locals => { :website_data => @drop, :page => page_drop }
  end

  post 'send_email', :provides => :json do
    if is_number?(params[:answer]) && Integer(params[:part_a]) + Integer(params[:part_b]) == Integer(params[:answer])
      if params[:name] != '' && params[:text] != '' && params[:email] != ''
        status 200
        json :status => "Ok", :msg => "Test message!"
      else
        status 403
        json :status => "Error", :msg => "Invalid validation"
      end
    else
      status 403
      json :status => "Error", :msg => "Invalid validation"
    end
  end

  not_found do
    load_hotel_and_data
    liquid :not_found_page
  end

  private

  def is_number?(string)
   true if Integer(string) rescue false
  end

end
