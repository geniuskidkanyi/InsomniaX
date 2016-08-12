# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatgroupsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatgroups.each do |chatgroup|
        stream_from "chatgroup:#{chatgroup.id}"
    end

  end

  def unsubscribed
    stop_all_streams
  end
end
