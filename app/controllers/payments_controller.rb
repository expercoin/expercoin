class PaymentsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def show
    @transaction = Transaction.find(params[:id])
    @profile = current_user.profile
  end

  def index
    @transactions = Transaction.where(sender: current_user.profile)
  end
end
