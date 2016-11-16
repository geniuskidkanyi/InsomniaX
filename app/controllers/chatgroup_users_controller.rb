class ChatgroupUsersController < ApplicationController
  before_action :authenticate_user!
    before_action :set_chatgroup


    def create
      @chatgroup_user = @chatgroup.chatgroup_users.where(user_id: current_user.id).first_or_create
      redirect_to @chatgroup
    end

    def destroy
      @chatgroup_user = @chatgroup.chatgroup_users.where(user_id: current_user.id).destroy_all
      redirect_to chatgroups_path
    end

    private

    def set_chatgroup
        @chatgroup = Chatgroup.friendly.find(params[:chatgroup_id])
    end
end
