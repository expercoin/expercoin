class PaymentsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def show
    @transaction = Transaction.find(params[:id])
    @profile = current_user.profile
  end

  def index
    transactions = SearchService.new(
      Transaction.where(sender: current_user.profile),
      params[:search]
    ).perform
    @transactions = transactions.page(params[:page]).per(8)
  end
end
