class WebsiteDataDrop < Liquid::Drop

  def initialize()
    # Here will be init website
    @website = WebsiteData.find(:id => 2)
  end

  def questions
    # This method return website questions
    @website.website_questions
  end

  def blog_records
    # This methods return website blog records
    @website.website_blog_records
  end

  def features
    # This method return website fetaures
    @website.website_features
  end

  def footers
    # This methods return website footers
    @website.website_footers
  end

  def rooms
    # This method return website rooms
    @website.website_rooms
  end

  def custom_rooms
    # This method return website custom rooms
    @website.website_custom_rooms
  end

  def pages
    # This methods return website pages
    @website.website_pages
  end

  def about_photos
    # This method return website about photos
    @website.website_about_photos
  end

  def links
    # This method return website links
    @website.website_links
  end

  def custom_room_photos
    # This methods return website custom room photos
    @website.website_custom_room_photos
  end

  def translations
    # This method return website translatinos
    @website.website_translations
  end

  def testimonials
    # This method return website testimonials
    @website.website_testimonials
  end

  def invisible_photos
    # This methods return invisiable photos
    @website.hotel.invisible_photos
  end

  def gallery_photos
    # This method return website gallery photos
    @website.hotel.gallery_photos
  end

  def photos
    # This method retunr website photos
    @website.hotel.photos
  end

end
