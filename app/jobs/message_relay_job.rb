class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
      ActionCable.server.broadcast "chatgroups:#{message.chatgroup.id}", {
      message: MessagesController.render(message),
      username: message.user.username,
      body: message.body,
      chatgroup_id: message.chatgroup.id
    }
  end
end
