class WebsiteBlogRecord < Sequel::Model
  many_to_one  :website_data

  liquid_methods :title, :text, :all_text
end

WebsiteBlogRecord.set_dataset :website_blog_records
