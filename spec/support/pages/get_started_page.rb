# frozen_string_literal: true

require 'support/pages/user_page'
class GetStartedPage < UserPage
  def go_to_dashboard
    click_on 'Go to Dashboard'
    sleep 1
  end

  def close_modal_go_to_dashboard
    find('a.close-panel').click
    sleep 1
  end

  def go_to_create_offer
    fill_content service_params[:content]
    select_category service_params[:category]
    attach_photo
    select_tags service_params[:tags]
    fill_and_submit_form 'service_form', service_params.except(:content, :category, :tags)
    sleep 1
  end

  def search_offers(text)
    # fill_content text
    # fill_and_submit_form 'search_form'
    # sleep 1
  end
end
