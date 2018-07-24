# frozen_string_literal: true

require 'support/pages/user_page'
class GetStartedPage < UserPage
  def go_to_dashboard
    click_on 'Go to Dashboard'
    sleep 0.1
  end

  def close_modal_go_to_dashboard
    find('a.close-panel').click
    sleep 0.1
  end

  def go_to_create_offers
    click_on 'Create your First Offer'
    sleep 0.1
  end

  def go_to_create_offer
    fill_content service_params[:content]
    select_category service_params[:category]
    attach_photo
    select_tags service_params[:tags]
    sleep 0.1
  end

  def search_offers(text)
    find('#search').set(text)
    find('#search').native.send_keys(:return)
    sleep 0.1
  end
end
