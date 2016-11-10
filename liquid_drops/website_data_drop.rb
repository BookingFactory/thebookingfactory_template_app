class WebsiteDataDrop < Liquid::Drop

  def initialize(data, rand)
    # Here will be init website
    @website = data
    @rand = rand
  end

  def hotel_name
    @website.hotel.name
  end

  def questions
    # This method return website questions
    @website.website_questions
  end

  def text_area
    @website.text_area
  end

  def contact_area_title
    @website.contact_area_title
  end

  def contact_description_text
    @website.contact_description_text
  end

  def phone_number
    @website.phone_number
  end

  def email_address
    @website.email_address
  end

  def tripadvisor_listing_link
    @website.tripadvisor_listing_link
  end

  def header_image
    # This method return header image
    @website.header_image
  end

  def tripadvisor_code
    @website.tripadvisor_code
  end

  def features_title
    @website.features_title
  end

  def faq_title
    @website.faq_title
  end

  def terms_and_conditions
    @website.terms_and_conditions
  end

  def privacy_policy
    @website.privacy_policy
  end

  def features_background_image
    @website.features_background_image
  end

  def header_text_1
    @website.header_text_1
  end

  def header_text_2
    @website.header_text_2
  end

  def booking_link
    @website.booking_link
  end

  def booking_button_text
    @website.booking_button_text
  end

  def booking_button_color
    @website.booking_button_color
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
    @website.website_rooms.each do |room|
      puts room.room_type
    end
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

  def top_links
    # This method return top links
    @website.top_links
  end

  def footer_links
    # This methods return footer links
    @website.footer_links
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
    # This method return website photos
    @website.hotel.photos
  end

  def about_text
    # This method return website about text
    @website.about_text
  end

  def blog_records
    # This method return all blog records
    @website.website_blog_records
  end

  def map_center_lat
    # This method return map latitude
    @website.map_center_lat
  end

  def map_center_lng
    # This method return map langitude
    @website.map_center_lng
  end

  def mobile_menu_fixed
    @website.mobile_menu_fixed
  end

  # This method return all avaliable langs in hotel

  def langs
    @website.hotel.website_datas_dataset.where({ :status => 'publish' }).map { |rec| rec.lang }
  end

  def membership_placement
    @website.hotel.member_settings.placement
  end

  def membership_description_color
    @website.hotel.member_settings.description_color
  end

  def membership_from_color
    @website.hotel.member_settings.from_color
  end

  def membership_active
    @website.hotel.membership_active
  end

  def rand_a
    @rand[:a]
  end

  def rand_b
    @rand[:b]
  end

end
