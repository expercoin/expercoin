ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
        :access_key_id     => ENV['SES_ACCESS_KEY_ID'],
        :secret_access_key => ENV['SES_SECRETE_ACCESS_KEY_ID']