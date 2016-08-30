class WebsiteDataDrop < Liquid::Drop

  def initialize()
    @website = WebsiteData.find(:id => 2)
  end

  def all
    WebsiteData.all
  end

  def questions
    @website.website_questions
  end

  def blog_records
    @website.website_blog_records
  end

  def features
    @website.website_features
  end

  def footers
    @website.website_footers
  end

  def rooms
    puts "*" * 8
    puts @website.website_rooms.last.room_type
  end

  def custom_rooms
    @website.website_custom_rooms
  end

  def pages
    @website.website_pages
  end

  def about_photos
    @website.website_about_photos
  end

  def redirects
    @website.website_redirects
  end

  def domains
    @website.website_domains
  end

  def links
    @website.website_links
  end

  def custom_room_photos
    @website.website_custom_room_photos
  end

  def translations
    @website.website_translations
  end

  def testimonials
    @website.website_testimonials
  end

  def invisible_photos
    @website.hotel.invisible_photos
  end

  def gallery_photos
    @website.hotel.gallery_photos
  end

  def photos
    @website.hotel.photos
  end

end
