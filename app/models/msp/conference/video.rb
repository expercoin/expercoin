module MSP
  module Conference
    # Stup class for Twilio
    class Video
      ACCOUNT_SID = 'AC8890c403b19f0c845249f6e09ebf230a'.freeze
      AUTH_TOKEN = 'c38f89bd9fff1f9ee210ff1bf68db00b'.freeze
      API_VIDEO_KEY_SID = 'SK70e2491c882f13e113678adb032608c1'.freeze
      API_VIDEO_KEY_SECRET = 'lWhQ85nnXT3XsppArBnj1B3BSs8p87Hm'.freeze

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

      def create_room(room_name)
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
        
      def kill_room(room_sid)
        begin
          client.video.rooms(room_sid).update(status: 'completed')
        rescue StandardError
          'room does not exist'
        end
      end
    end
  end
end
