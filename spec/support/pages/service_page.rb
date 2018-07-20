# frozen_string_literal: true

require 'support/pages/user_page'
class ServicePage < UserPage
  def fill_service_fields(service_params)
    fill_content service_params[:content]
    select_category service_params[:category]
    attach_photo
    select_tags service_params[:tags]
    fill_and_submit_form 'service_form', service_params.except(:content, :category, :tags)
    sleep 1
  end

  def click_view_service
    click_on 'View Offer'
    sleep 0.3
  end

  private

  def select_category(category)
    select 'service_form', category_id: category
  end

  def fill_content(text)
    tinymce_fill_in 'service_form_content', with: text
  end

  def select_tags(tags)
    select2_field = all('.select2-selection')[1].click
    tags.each do |tag|
      select2_field.find('input').set(tag)
      select2_field.find('input').native.send_keys(:return)
    end
  end
end
