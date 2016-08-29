class WebsiteTestimonial < Sequel::Model
  many_to_one :website_data
end

WebsiteTestimonial.set_dataset :website_testimonials
