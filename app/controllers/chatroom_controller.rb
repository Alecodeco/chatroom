class ChatroomController < ApplicationController

  before_action :require_user

  def index
    @messages = Message.custom_display
    @message = Message.new
    @user = User.all
  end  


end
