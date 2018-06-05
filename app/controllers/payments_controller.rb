class PaymentsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def show
    @payment = Transaction.find(params[:id])
  end

  def index
    @payments = Transaction.where(sender: current_user.profile)
  end

  def received
    @payments = Transaction.where(receiver: current_user.profile)
  end
end
