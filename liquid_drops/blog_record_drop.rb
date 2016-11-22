class BlogRecrodDrop < Liquid::Drop

  def initialize(record)
    @record = record
  end

  def cover
    @record.cover
  end

  def title
    @record.title
  end

  def created_at
    @record.created_at
  end

  def alt_text
    @record.alt_text
  end

  def text
    @record.text
  end

  def disqus_code
    @record.disqus_code
  end

  def meta_description
    @record.meta_description
  end

end
