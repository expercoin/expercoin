module MSP
  module Conference
    # Stup class for Twilio
    class Video
      ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
      AUTH_TOKEN =  ENV['TWILIO_AUTH_TOKEN']
      API_VIDEO_KEY_SID = ENV['TWILIO_API_VIDEO_KEY_SID']
      API_VIDEO_KEY_SECRET = ENV['TWILIO_API_VIDEO_KEY_SECRET']
      
      attr_reader :client

      def initialize
        @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
      end

      def call; end

      def generate_access_token
        token = Twilio::JWT::AccessToken.new(
          ACCOUNT_SID,
          API_VIDEO_KEY_SID,
          API_VIDEO_KEY_SECRET
        )
        token
      end

      def grant_access_to_video(room)
        grant = Twilio::JWT::AccessToken::VideoGrant.new
        grant.room = room
        grant
      end

      def access_token(identity, room)
        token = generate_access_token
        grant = grant_access_to_video(room)
        token.add_grant(grant)
        token.identity = identity
        token.to_jwt
      end

      def create_room
        begin
          group_room = client.video.rooms.create(
            # unique_name: 'DailyStandup',
            # type: 'group',
            # record_participants_on_connect: true,
            # status_callback: 'http://example.org'
          )
          group_room.sid
        rescue StandardError
          false
        end
      end
      
      def find_room(room_sid)
        client.video.rooms(room_sid).fetch
        rescue StandardError
      end

      def room_closed?(room_sid)
        room = find_room(room_sid)
        return unless room
        room.status == 'completed'
      end

      def kill_room(room_sid)
        client.video.rooms(room_sid).update(status: 'completed')
      rescue StandardError
        'room does not exist'
      end
    end
  end
end
