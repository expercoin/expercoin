# frozen_string_literal: true

class PageMetaTagsOptions
  def initialize(page)
    @page = page
  end

  def default_options
    return unless @page
    {
      site: name,
      title: title,
      description: description,
      keywords: keywords,
      og: og
    }
  end

  private

  def name
    @page.name
  end

  def title
    @page.title
  end

  def description
    @page.description
  end

  def keywords
    @page.keywords
  end

  def url
    @page.url
  end

  def og
    {
      url: url,
      site_name: name,
      title: title,
      description: description,
      type: 'website'
    }
  end
end
