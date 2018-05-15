class SearchRequestsService < BaseService
  def initialize(requests, search)
    @requests = requests
    @search = search
  end

  def perform
    filter
    order
    @requests
  end

  private

  def valid?
    @search.present? && @search.length > 2
  end

  def filter
    return unless valid?
    @requests = @requests.pg_search(@search) if Rails.env.production?
    @requests = sql_lite_search if Rails.env.development?
  end

  def order
    @requests = @requests.order(created_at: :desc)
  end

  def sql_lite_search
    @requests.where(
      "title LIKE ? OR message LIKE ?",
      "%#{@search}%", "%#{@search}%"
    )
  end
end