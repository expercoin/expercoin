module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user
    end

    protected

    def find_verified_user
      User.find(@request.session["warden.user.user.key"][0][0])
    rescue StandardError
      reject_unauthorized_connection
    end
  end
end