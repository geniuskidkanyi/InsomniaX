class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatgroup
  def create
  message =  @chatgroup.messages.new(message_params)
  message.user = current_user
  message.save
  end
private
  def set_chatgroup
      @chatgroup = Chatgroup.find(params[:chatgroup_id])
  end
  def message_params
    params.require(:message).permit(:body)
  end
end
