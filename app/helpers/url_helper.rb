module UrlHelper
  def valid_url(url)
    domain = 'http://localhost:3000' if Rails.env.development?
    domain = ENV['FULL_DOMAIN'] if Rails.env.production?
    ValidUrl.new(url, domain).valid?
  end
end