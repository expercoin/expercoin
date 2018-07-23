class DashboardMessageFinder
  def initialize(user)
    @user = user
  end

  def perform
    return 'offer_message' if services.empty?
    return 'linkedin_message' unless @user.verified?
    return 'confirm_email_message' unless @user.confirmed?
    return 'wallet_message' unless eth_addresses&.any?
  end

  private

  def services
    @user.profile.services
  end

  def eth_addresses
    @user.profile.wallet&.eth_addresses
  end
end
