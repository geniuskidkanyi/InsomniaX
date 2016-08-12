class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
      ActionCable.server.broadcast "chatgroups:#{message.chatgroup.id}", {
      message: MessagesController.render(message),
      chatgroup_id: message.chatgroup.id
    }
  end
end
