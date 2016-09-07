require "sinatra"
require "sinatra/base"
require "sinatra/namespace"
require "sinatra/config_file"
require "sequel"
require "liquid"

DB = Sequel.postgres(ENV['BUQIT_DB_NAME'],
  :user => ENV['BUQIT_DB_USERNAME'],
  :password => ENV['BUQIT_DB_PASSWORD'],
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

class Website < Sinatra::Base
  register Sinatra::ConfigFile

  config_file "./config/config.yml"

  before "/:slug" do
    load_hotel_and_data
  end

  ["/terms_and_conditions", "/:lang/terms_and_conditions", "/:slug/terms_and_conditions", "/:slug/:lang/terms_and_conditions"].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :terms_and_conditions, :locals => { :website_data => @drop }
    end
  end

  ["/privacy-policy", "/:lang/privacy_policy", "/:slug/privacy_policy", "/:slug/:lang/privacy_policy"].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :privacy_policy, :locals => { :website_data => @drop }
    end
  end

  ["/about", "/:lang/about", "/:slug/about", "/:slug/:lang/about"].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :about_page, :locals => { :website_data => @drop }
    end
  end

  ["/faq", "/:lang/faq", "/:slug/faq", "/:slug/:lang/faq"].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :faq_page, :locals => { :website_data => @drop }
    end
  end

  ["/contacts", "/:lang/contacts", "/:slug/contacts", "/:slug/:en/contacts"].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :contact_page, :locals => { :website_data => @drop }
    end
  end

  ["/blog", "/:lang/blog", "/:slug/blog", "/:slug/:lang/blog"].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :blog_page, :locals => { :website_data => @drop }
    end
  end

  ["/gallery", "/:lang/gallery", "/:slug/gallery", "/:slug/:en/gallery"].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :gallery_page, :locals => { :website_data => @drop }
    end
  end

  ["/membership", "/:lang/membership", "/:slug/membership", "/:slug/:lang/membership"].each do |route|
    get route do
      liquid :membership_page, :locals => { :website_data => @drop }
    end
  end

  ["/book", "/:lang/book", "/:slug/book", "/:slug/:lang/book"].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :book_page, :locals => { :website_data => @drop }
    end
  end

  ["/", "/:lang", "/:slug", '/:slug/:lang'].each do |route|
    get route do
      pass if params[:lang] && params[:lang].length > 2
      liquid :index, :locals => { :website_data => @drop }
    end
  end

  not_found do
    liquid :not_found_page
  end

  private

  def load_hotel_and_data

    @lang = params[:lang] ? params[:lang] : 'en'

    if settings.domains.split(',').include?(request.host) && params[:slug]
      @hotel = Hotel.find(:slug => params[:slug])
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
      @data = []
      @hotel.website_datas.each do |wd|
        if wd.status == "publish" && wd.lang == @lang
          @data << wd
        end
      end
      if @data[0]
        @drop = WebsiteDataDrop.new(@data[0])
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

end
