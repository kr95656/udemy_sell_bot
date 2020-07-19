class LinebotController < ApplicationController
  def callback
    body = request.body.read
    events = client.parse_events_from(body)

    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            text: event.message['text']
          }
          client.reply_message(event['replyToken'], message)
        when Line::Bot::Event::MessageType::Follow #友達登録イベント
          userId = event['source']['userId'] 
          User.find_or_create_by(uid: userId)
        when Line::Bot::Event::MessageType::Unfollow #友達削除イベント
          userId = event['source']['userId']  
          user = User.find_by(uid: userId)
          user.destroy if user.present?
        when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
          response = client.get_message_content(event.message['id'])
          tf = Tempfile.open("content")
          tf.write(response.body)
        end
      end
    }
    "OK"
  end
end


