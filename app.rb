require "sinatra"
require "sinatra/base"
require "sinatra/namespace"
require "sinatra/config_file"
require "sequel"
require "liquid"
require "./config.rb"
require 'better_errors'
require 'binding_of_caller'

#DB = Sequel.connect("postgres://#{ENV['DATABASE_USER']}:#{ENV['DATABASE_PASSWORD']}@#{ENV['DATABASE_HOST']}/#{ENV['DATABASE_NAME']}")

DB = Sequel.postgres('buuqit',
  :user => 'buuqit_user',
  :password => 'buuqit_password',
  :host => 'localhost',
  :port => 5432
)

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

    post 'send_email' do
      if is_number?(params[:answer]) && Integer(params[:part_a]) + Integer(params[:part_b]) == Integer(params[:answer])
        if params[:name] != '' && params[:text] != '' && params[:email] != ''
          # here we should pass pony mail settings
          Pony
        end
      end
    end
  end

  namespace '/:slug' do
    ["", "/:lang"].each do |route|
      get route do
        pass if params[:lang] && params[:lang].length > 2
        load_hotel_and_data
        raise 'error'
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
        load_hotel_and_data
        liquid :blog_record, :locals => { :website_data => @drop}
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
        "Render custom page"
      end
    end

    post 'send_email' do
      if is_number?(params[:answer]) && Integer(params[:part_a]) + Integer(params[:part_b]) == Integer(params[:answer])
        if params[:name] != '' && params[:text] != '' && params[:email] != ''
          #here we should pass pony params
        end
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
    else
      if request.host.split('.')[0] == "www"
        redirect_address = "#{request.scheme}://#{request.host.gsub('www.', '')}#{request.path}"
      elsif WebsiteData.where({url: request.host, status: "publish"}).to_a.length > 0
        @wd = WebsiteData.where({url: request.host, status: 'publish'}).first
        @hotel = @wd.hotel unless @wd.nil?
        lng = params[:lang] ? "/#{@lang}" : ""
        @base = "//#{request.host}#{lng}"
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
        @template = @data.template.nil? ? '1' : @data.template

        Website.set :views, File.dirname(__FILE__) + "/views/#{@template}"
        Website.set :public_folder, File.dirname(__FILE__) + "/views/#{@template}/assets"

        @drop = WebsiteDataDrop.new(@data, @rand)
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
