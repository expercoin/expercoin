class AdminMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def new_offer(offer)
    @offer = offer
    mail(to: 'mentor@expercoin.com', subject: 'New Offer submitted')
  end
end
