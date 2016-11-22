class PageDrop < Liquid::Drop
  def initialize(page)
    @page = page
  end

  def website_page_photos
  end

  def content
  end

  def meta_description
    @page.meta_description
  end
end
