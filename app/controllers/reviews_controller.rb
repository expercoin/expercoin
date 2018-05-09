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
        return unless review.save
        flash[:notice] = 'Your review has been submited'
        redirect_to request_path(@request)
      end

      private

      def review_params
        params.except(:request_id).require(:review).permit(
          :rate,
          :message,
          :title
        ).merge(
          request_id: @request.id,
          profile_id: @request.expert.id,
          author_id: current_user.profile.id
        )
      end

      def find_request
        @request = Request.find(params[:review][:request_id])
      end
    end