# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatgroupsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatgroups.each do |chatgroup|

        stream_from "chatgroups:#{chatgroup.id}"
    end

  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    # Rails.logger.info data
    @chatgroup = Chatgroup.find(data["chatgroup_id"])
    message   = @chatgroup.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
