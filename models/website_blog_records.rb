class WebsiteBlogRecord < Sequel::Model
  many_to_one  :website_data
end

WebsiteBlogRecord.set_dataset :website_blog_records
