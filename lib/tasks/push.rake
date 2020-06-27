namespace :push_line do 
  desc "push_line"
  task push_line_message_morning: :environment do # 以下にpush機能のタスクを書く。
    message = {
      type: 'text',
      text: '朝になりました。本日も頑張りましょう。食べた食べ物を「ひらがな」で入力すると、食品のカロリーと本日のトータルカロリーが表示されます。入力ミスの場合、「みす」と入力すると最新の入力を消去できます。カロリー計算に使ってください。'
    }
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
    response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
    p response
  end
end