module RequireFile
  def file_url(file_path)
    "#{file_path}"
  end
end

Liquid::Template.register_filter(RequireFile)
