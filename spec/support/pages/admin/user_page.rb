# frozen_string_literal: true

module Admin
  class UserPage
    include Capybara::DSL

    def initialize(url = nil, user = nil)
      @url = url
      @user = user
      LoginPage.new(user).fill_and_submit_form if user.present?
    end

    def open
      visit url
    end

    def submit_form(submit = 'Save')
      click_on submit
    end

    def click_schedule_session
      visit url
      click_on 'Schedule Session'
      sleep 0.1
    end

    def fill_and_submit_form(scope, params, submit = 'Save')
      params.keys.each do |key|
        fill_in "#{scope}[#{key}]", with: params[key]
      end
      click_on submit
    end

    def tinymce_fill_in(name, options = {})
      if page.driver.browser.browser == :chrome
        page.driver.browser.switch_to.frame("#{name}_ifr")
        page.find(:css, '#tinymce').native.send_keys(options[:with])
        page.driver.browser.switch_to.default_content
      else
        page.execute_script("tinyMCE.get('#{name}').setContent('#{options[:with]}')")
      end
    end

    def select(scope, params)
      params.keys.each do |key|
        page.select params[key], from: "#{scope}[#{key}]"
      end
    end

    def attach_photo(element_id = 'photo_uploader')
      attach_file(element_id, File.absolute_path("#{Rails.root}/public/images/fake/#{rand(1..8)}.jpg"), visible: :all)
    end

    private

    attr_reader :url, :user
  end
end
