class WebsiteBlogRecord < Sequel::Model
  many_to_one  :website_data

  FILE_FIELD = 'covers'

  def cover
    self.cover_file_name.nil? ? false : true
  end

  def image
    {
      :id => self.id,
      :class_name => self.class.table_name,
      :file_field => FILE_FIELD,
      :file_name => self.photo_file_name
    }
  end

  liquid_methods :title, :text, :slug, :created_at, :all_text, :image
end

WebsiteBlogRecord.set_dataset :website_blog_records
