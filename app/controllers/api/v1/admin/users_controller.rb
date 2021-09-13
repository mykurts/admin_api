class Api::V1::Admin::UsersController < ApplicationController

  def index
    # fetch messages in channel
    client = Slack::Web::Client.new

    channels = client.conversations_list.channels
    if channels.pluck(:name).include? params[:channel]
      conversation = client.conversations_history(channel: "#" << "#{params[:channel]}")
      @messages = conversation.messages.map do |message|
        user = client.users_info(user: message['user']) if message['user'].present? 
        to_slack_channel_messages(message, user)
      end
      render_success(data: @messages)
    else
      render_error(compose_msg(:error, "Channel not found!"), 404)
    end

  end


end
