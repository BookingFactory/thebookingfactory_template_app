class WebsiteTestimonial < Sequel::Model
  many_to_one :website_data

  liquid_methods :title, :body, :name
end

WebsiteTestimonial.set_dataset :website_testimonials
