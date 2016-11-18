require "sinatra"
require "sinatra/base"
require "sinatra/namespace"
require "sinatra/config_file"
require "sequel"
require "liquid"
require "./config.rb"
require 'better_errors'
require 'binding_of_caller'
require "sinatra/json"

DB = Sequel.connect("postgres://#{ENV['DATABASE_USER']}:#{ENV['DATABASE_PASSWORD']}@#{ENV['DATABASE_HOST']}/#{ENV['DATABASE_NAME']}")

Dir.glob("./models/*.rb") do |model|
  require "#{model}"
end

Dir.glob("./liquid_drops/*.rb") do |drop|
  require "#{drop}"
end

Dir.glob("./liquid_filters/*.rb") do |filter|
  require "#{filter}"
end

Dir.glob("./helpers/*.rb") do |helper|
  require "#{helper}"
end

class Website < Sinatra::Base

  @slug_hotel = false

  register Sinatra::ConfigFile
  register Sinatra::Namespace

  helpers Sinatra::HTMLEscapeHelper

  config_file "./config/config.yml"

  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path('..', __FILE__)
  end

  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    username == 'buuqit' and password == '0sx3092j'
  end

  namespace '/' do

    ["", ":lang"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :index, :locals => { :website_data => @drop }
      end
    end

    ["terms-and-conditions", ":lang/terms-and-conditions"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :terms_and_conditions, :locals => { :website_data => @drop}
      end
    end

    ["privacy-policy", ":lang/privacy_policy"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :privacy_policy, :locals => { :website_data => @drop }
      end
    end

    ["about", ":lang/about"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :about_page, :locals => { :website_data => @drop }
      end
    end

    ["faq", ":lang/faq"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :faq_page, :locals => { :website_data => @drop }
      end
    end

    ["contacts", ":lang/contacts"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :contact_page, :locals => { :website_data => @drop }
      end
    end

    ["blog", ":lang/blog"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :blog_page, :locals => { :website_data => @drop }
      end
    end

    ["blog_next", ":lang/blog_next"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :blog_page, :locals => { :website_data => @drop }
      end
    end

    ["blog/:page", ":lang/blog/:page"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        record = @data.website_blog_records_dataset.where(:slug => params[:page])
        if record.any? && record.first
          current_record = BlogRecrodDrop.new(record.first)
          liquid :blog_record, :locals => { :website_data => @drop, :record => current_record }
        else
          liquid :not_found_page
        end
      end
    end

    ["gallery", ":lang/gallery"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :gallery_page, :locals => { :website_data => @drop }
      end
    end

    ["membership", ":lang/membership"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :membership_page, :locals => { :website_data => @drop }
      end
    end

    ["book", ":lang/book"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :book_page, :locals => { :website_data => @drop }
      end
    end

    ["/:page", "/:lang/:page"].each do |route|
      get route do
        load_hotel_and_data

        number = @data.website_rooms_dataset.where("lower(slug) = ?", html_safe(params[:page]).downcase).first
        room = @data.website_custom_rooms_dataset.where("lower(slug) = ?", html_safe(params[:page]).downcase).first
        page = @data.website_pages_dataset.where("lower(slug) = ?", html_safe(params[:page]).downcase).first

        if (page && page.published) || number || room
          if number
            number_drop = NumberDrop.new(number)
            liquid :number, :locals => { :website_data => @drop, :number => number_drop }
          elsif room
            room_drop = RoomDrop.new(room)
            liquid :other_room, :locals => { :website_data => @drop, :room => room_drop }
          elsif page
            page_drop = PageDrop.new(pages)
            liquid :custom_page, :locals => { :website_data => @drop, :page => page_drop }
          end
        else
          liquid :not_found_page
        end
      end
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
  end

  namespace '/:slug' do

    ["", "/:lang"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :index, :locals => { :website_data => @drop }
      end
    end

    ["/terms-and-conditions", "/:lang/terms-and-conditions"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        liquid :terms_and_conditions, :locals => { :website_data => @drop}
      end
    end

    ["/privacy-policy", "/:lang/privacy_policy"].each do |route|
      get route do
        load_hotel_and_data
        liquid :privacy_policy, :locals => { :website_data => @drop }
      end
    end

    ["/about", "/:lang/about"].each do |route|
      get route do
        load_hotel_and_data
        liquid :about_page, :locals => { :website_data => @drop }
      end
    end

    ["/faq", "/:lang/faq"].each do |route|
      get route do
        load_hotel_and_data
        liquid :faq_page, :locals => { :website_data => @drop }
      end
    end

    ["/contacts", "/:lang/contacts"].each do |route|
      get route do
        load_hotel_and_data
        liquid :contact_page, :locals => { :website_data => @drop }
      end
    end

    ["/blog", "/:lang/blog"].each do |route|
      get route do
        load_hotel_and_data
        liquid :blog_page, :locals => { :website_data => @drop }
      end
    end

    ["/blog_next", "/:lang/blog_next"].each do |route|
      get route do
        load_hotel_and_data
        liquid :blog_page, :locals => { :website_data => @drop }
      end
    end

    ["/blog/:page", "/:lang/blog/:page"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        record = @data.website_blog_records_dataset.where(:slug => params[:page])
        if record.any? && record.first
          current_record = BlogRecrodDrop.new(record.first)
          liquid :blog_record, :locals => { :website_data => @drop, :record => current_record }
        else
          liquid :not_found_page
        end
      end
    end

    ["/gallery", "/:lang/gallery"].each do |route|
      get route do
        load_hotel_and_data
        liquid :gallery_page, :locals => { :website_data => @drop }
      end
    end

    ["/membership", "/:lang/membership"].each do |route|
      get route do
        load_hotel_and_data
        liquid :membership_page, :locals => { :website_data => @drop }
      end
    end

    ["/book", "/:lang/book"].each do |route|
      get route do
        load_hotel_and_data
        liquid :book_page, :locals => { :website_data => @drop }
      end
    end

    ["/:page", "/:lang/:page"].each do |route|
      get route do
        load_hotel_and_data

        number = @data.website_rooms_dataset.where("lower(slug) = ?", html_safe(params[:page]).downcase).first
        room = @data.website_custom_rooms_dataset.where("lower(slug) = ?", html_safe(params[:page]).downcase).first
        page = @data.website_pages_dataset.where("lower(slug) = ?", html_safe(params[:page]).downcase).first


        if (page && page.published) || number || room
          if number
            number_drop = NumberDrop.new(number)
            liquid :number, :locals => { :website_data => @drop, :number => number_drop }
          elsif room
            room_drop = RoomDrop.new(room)
            liquid :other_room, :locals => { :website_data => @drop, :room => room_drop }
          elsif page
            page_drop = PageDrop.new(pages)
            liquid :custom_page, :locals => { :website_data => @drop, :page => page_drop }
          end
        else
          liquid :not_found_page
        end

      end
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

  end

  not_found do
    load_hotel_and_data
    liquid :not_found_page
  end

  private

  def load_hotel_and_data

    @lang = params[:lang] ? params[:lang] : 'en'

    @rand = {
      :a => rand(1..9),
      :b => rand(1..9)
    }

    if settings.domains.split(',').include?(request.host) && params[:slug]
      @hotel = Hotel.where("lower(slug) = ?", html_safe(params[:slug]).downcase).last
      @base = "//#{request.host}/#{params[:slug]}/#{@lang}"
      @slug_hotel = true
    else
      if request.host.split('.')[0] == "www"
        redirect_address = "#{request.scheme}://#{request.host.gsub('www.', '')}#{request.path}"
      elsif WebsiteData.where({url: request.host, status: "publish"}).to_a.length > 0
        @wd = WebsiteData.where({url: request.host, status: 'publish'}).first
        @hotel = @wd.hotel unless @wd.nil?
        lng = params[:lang] ? "/#{@lang}" : ""
        @base = "//#{request.host}#{lng}"
        @self_domain_website = true
      elsif WebsiteDomain.where(domain: request.host).to_a.length > 0
        domains = WebsiteDomain.where(domain: request.host)
        domains.each do |domain|
          if domain.website_data.status == 'publish'
            redirect_address = "#{request.scheme}://#{domain.website_data.url}#{request.path}"
          end
        end
      end
    end
    if @hotel
      data = []
      @hotel.website_datas.each do |wd|
        if wd.status == "publish" && wd.lang == @lang
          data << wd
        end
      end
      if data[0]
        @data = data[0]
        @template = @data.website_template.nil? ? '1' : @data.website_template.id

        Website.set :root, File.dirname(__FILE__)
        Website.set :views, File.dirname(__FILE__) + "/#{@template}/views"
        Website.set :public_folder, File.dirname(__FILE__) + "/#{@template}/assets"
        Website.set :static, true

        @drop = WebsiteDataDrop.new(@data, @rand, @lang)
      else
        raise Sinatra::NotFound
      end
    else
      if redirect_address
        redirect redirect_address, 301
      else
        raise Sinatra::NotFound
      end
    end
  end

  def is_number?(string)
    true if Integer(string) rescue false
  end

end
