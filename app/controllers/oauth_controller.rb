class OauthController < ApplicationController
  def callback
    begin
      oauth = OauthService.new(request.env['omniauth.auth'])
      if oauth_account = oauth.create_oauth_account!
        sign_in(oauth_account.user)
        redirect_to root_path
      end
    rescue => e
      binding.pry
      flash[:alert] = "There was an error while trying to authenticate your account."
      redirect_to root_path
    end
  end

  def failure
    binding.pry
    flash[:alert] = "There was an error while trying to authenticate your account."
    redirect_to root_path
  end
end
