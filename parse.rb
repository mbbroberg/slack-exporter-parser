require 'json'
require 'slack-ruby-client'
# require 'pry'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

client = Slack::Web::Client.new

file = File.read('channels.json')
channel_hash = JSON.parse(file)

# Header of the CSV 
puts "Channel" + "," + "Status" + "," + "Archived" + "," + "Creator" + "," + "Date Created"

channel_hash.each do |x|
    channel = x['name']
    channel_id = x['id']

    archived = "No"
    if x["is_archived"] 
        archived = "Yes"
    end

    # Learned about the convention of channels for ids
    # 'C' are Public
    # 'G' are Private
    openness = ""
    if channel_id[0] == 'C'
        openness = 'Public'
    else
        openness = 'Private'
    end

    user_object = client.users_info(user: x["creator"])
    user = user_object["user"]["name"]
    # binding.pry 

    # Note that the archive downloads time in local time
    time = Time.at(x["created"].to_i).utc.to_s
    date = time.split[0]

    puts channel + "," + openness + "," + archived + "," + user + "," + date
end
