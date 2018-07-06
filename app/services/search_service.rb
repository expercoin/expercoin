class SearchService < BaseService
  def initialize(collection, search)
    @collection = collection
    @search = search
  end

  def perform
    filter
    order
    @collection
  end

  private

  def valid?
    @search.present? && @search.length > 2
  end

  def filter
    return unless valid?
    @collection = @collection.search(@search) if Rails.env.production?
    @collection = sql_lite_search if Rails.env.development? || Rails.env.test?
  end

  def order
    @collection = @collection.order(created_at: :desc)
  end

  def sql_lite_search
    @collection.where(
      "title  LIKE ?",
      "%#{@search}%"
    )
  end
end
