class ValidUrl
  def initialize(url, domain = nil)
    @url = url
    @domain = domain
  end

  def absolute_url
    return @url unless url_relative?
    relative_to_absolute
  end

  def valid_absolute_url
    return unless valid?
    absolute_url
  end

  def valid?
    url = URI.parse(absolute_url)
    @http = Net::HTTP.new(url.host, url.port)
    use_ssl_if_domain_has_one
    request = Net::HTTP::Get.new(url.request_uri)
    @http.request(request).class == Net::HTTPOK
  rescue StandardError
    return false
  end

  def use_ssl_if_domain_has_one
    return unless ssl_domain?
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  def ssl_domain?
    @domain.starts_with?('https')
  end

  def url_relative?
    URI::DEFAULT_PARSER.regexp[:ABS_URI] !~ @url
  end

  def relative_to_absolute
    return if @url.blank?
    "#{@domain}/#{@url}"
  end
end