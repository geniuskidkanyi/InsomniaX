class DirectMessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    users = [current_user, User.find(params[:id])]
    @chatgroup = Chatgroup.direct_message_for_users(users)
    @messages = @chatgroup.messages.order(created_at: :desc).limit(100).reverse
    @chatgroup_user = current_user.chatgroup_users.find_by(chatgroup_id: @chatgroup.id)
    render "chatgroups/show"
  end
end
