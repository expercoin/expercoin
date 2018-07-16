# frozen_string_literal: true

require 'support/pages/user_page'
module Settings
  class WalletPage < UserPage
    def set_as_default(address)
      find('li', text: address).find('a', text: 'Set as Default').click
    end

    def delete(address)
      find('li', text: address).find('a', text: 'Delete').click
      visit url
    end
  end
end
