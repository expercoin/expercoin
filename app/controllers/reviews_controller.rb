class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_request
  attr_reader :review

  layout 'dashboard'

  def new
    @review = Review.new(rate: 5)
  end

  def create
    @review = Review.new(review_params)
    @verify_review_service = VerifyReviewService.new(review: @review)
    return unless @verify_review_service.perform
    flash[:notice] = 'Your review has been submited'
    redirect_to request.referer
  end

  private

  def review_params
    params.except(:request_id).require(:review).permit(
      :rate,
      :message,
      :title,
      :tx_hash
    ).merge(
      request_id: @request.id,
      profile_id: review_receiver.id,
      author_id: current_user.profile.id
    )
  end

  def find_request
    @request ||= current_user.profile.created_requests.find_by_id(params[:review][:request_id])
    @request ||= current_user.profile.requests.find_by_id(params[:review][:request_id])
  end

  def review_receiver
    current_user.profile == @request.expert ? @request.requester : @request.expert
  end
end
