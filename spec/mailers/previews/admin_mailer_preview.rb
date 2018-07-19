# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def new_offer
    offer = Service.pending.sample
    AdminMailer.new_offer(offer)
  end
end
