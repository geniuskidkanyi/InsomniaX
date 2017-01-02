class ChatgroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatgroup, only: [:show, :edit, :update, :destroy]


  # GET /chatgroups
  # GET /chatgroups.json
  def index
    @chatgroups = Chatgroup.public_channels
    @direct_messages = Chatgroup.direct_messages
  end

  # GET /chatgroups/1
  # GET /chatgroups/1.json
  def show
    @messages = @chatgroup.messages.order(created_at: :desc).limit(100).reverse
    @chatgroup_user = current_user.chatgroup_users.find_by(chatgroup_id: @chatgroup.id)
  end

  # GET /chatgroups/new
  def new
    @chatgroup = Chatgroup.new
  end

  # GET /chatgroups/1/edit
  def edit
  end

  # POST /chatgroups
  # POST /chatgroups.json
  def create
    @chatgroup = Chatgroup.new(chatgroup_params)

    respond_to do |format|
      if @chatgroup.save
        format.html { redirect_to @chatgroup, notice: 'Chatgroup was successfully created.' }
        format.json { render :show, status: :created, location: @chatgroup }
      else
        format.html { render :new }
        format.json { render json: @chatgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatgroups/1
  # PATCH/PUT /chatgroups/1.json
  def update
    respond_to do |format|
      if @chatgroup.update(chatgroup_params)
        format.html { redirect_to @chatgroup, notice: 'Chatgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatgroup }
      else
        format.html { render :edit }
        format.json { render json: @chatgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatgroups/1
  # DELETE /chatgroups/1.json
  def destroy
    @chatgroup.destroy
    respond_to do |format|
      format.html { redirect_to chatgroups_url, notice: 'Chatgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatgroup
      @chatgroup = Chatgroup.friendly.find(params[:id])
      @users = @chatgroup.users.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chatgroup_params
      params.require(:chatgroup).permit(:name, :description, :slug)
    end
end
