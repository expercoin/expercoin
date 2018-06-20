# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, 'https://video.twilio.com/v1/Rooms')
      .with(
        headers: {
          'Accept' => 'application/json',
          'Accept-Charset' => 'utf-8',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => 'Basic QUM4ODkwYzQwM2IxOWYwYzg0NTI0OWY2ZTA5ZWJmMjMwYTpjMzhmODliZDlmZmYxZjllZTIxMGZmMWJmNjhkYjAwYg==',
          'Content-Type' => 'application/x-www-form-urlencoded',
          'User-Agent' => 'twilio-ruby/5.6.4 (ruby/x86_64-linux 2.5.0-p0)'
        }
      )
      .to_return(status: 201, body: '{"status": "completed", "unique_name": "RM1cfdb11a479b2f061fb498e416a08d8f", "date_updated": "2018-06-20T13:39:13Z", "video_codecs": ["VP8"], "max_participants": 50, "record_participants_on_connect": false, "enable_turn": true, "account_sid": "AC8890c403b19f0c845249f6e09ebf230a", "url": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f", "end_time": null, "sid": "RM1cfdb11a479b2f061fb498e416a08d8f", "duration": null, "date_created": "2018-06-20T13:39:13Z", "media_region": "us1", "type": "group", "status_callback_method": "POST", "status_callback": "https://19207ed9.ngrok.io/callbacks", "links": {"recordings": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f/Recordings", "participants": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f/Participants"}}', headers: {})

    stub_request(:get, 'https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f')
      .with(
        headers: {
          'Accept' => 'application/json',
          'Accept-Charset' => 'utf-8',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => 'Basic QUM4ODkwYzQwM2IxOWYwYzg0NTI0OWY2ZTA5ZWJmMjMwYTpjMzhmODliZDlmZmYxZjllZTIxMGZmMWJmNjhkYjAwYg==',
          'User-Agent' => 'twilio-ruby/5.6.4 (ruby/x86_64-linux 2.5.0-p0)'
        }
      )
      .to_return(status: 200, body: '{"status": "completed", "unique_name": "RM1cfdb11a479b2f061fb498e416a08d8f", "date_updated": "2018-06-20T13:39:13Z", "video_codecs": ["VP8"], "max_participants": 50, "record_participants_on_connect": false, "enable_turn": true, "account_sid": "AC8890c403b19f0c845249f6e09ebf230a", "url": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f", "end_time": null, "sid": "RM1cfdb11a479b2f061fb498e416a08d8f", "duration": null, "date_created": "2018-06-20T13:39:13Z", "media_region": "us1", "type": "group", "status_callback_method": "POST", "status_callback": "https://19207ed9.ngrok.io/callbacks", "links": {"recordings": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f/Recordings", "participants": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f/Participants"}}', headers: {})

    stub_request(:post, 'https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f')
      .with(
        body: { 'Status' => 'completed' },
        headers: {
          'Accept' => 'application/json',
          'Accept-Charset' => 'utf-8',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => 'Basic QUM4ODkwYzQwM2IxOWYwYzg0NTI0OWY2ZTA5ZWJmMjMwYTpjMzhmODliZDlmZmYxZjllZTIxMGZmMWJmNjhkYjAwYg==',
          'Content-Type' => 'application/x-www-form-urlencoded',
          'User-Agent' => 'twilio-ruby/5.6.4 (ruby/x86_64-linux 2.5.0-p0)'
        }
      )
      .to_return(status: 202, body: '{"status": "completed", "unique_name": "RM1cfdb11a479b2f061fb498e416a08d8f", "date_updated": "2018-06-20T13:39:13Z", "video_codecs": ["VP8"], "max_participants": 50, "record_participants_on_connect": false, "enable_turn": true, "account_sid": "AC8890c403b19f0c845249f6e09ebf230a", "url": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f", "end_time": "2018-06-20T13:42:57Z", "sid": "RM1cfdb11a479b2f061fb498e416a08d8f", "duration": 223, "date_created": "2018-06-20T13:39:13Z", "media_region": "us1", "type": "group", "status_callback_method": "POST", "status_callback": "https://19207ed9.ngrok.io/callbacks", "links": {"recordings": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f/Recordings", "participants": "https://video.twilio.com/v1/Rooms/RM1cfdb11a479b2f061fb498e416a08d8f/Participants"}}', headers: {})
  end
end
