class ChatroomController < ApplicationController

  before_action :require_user

  def index
    @status_list = [["Online","green"], ["Busy","red"], ["Away","yellow"]]
    @messages = Message.custom_display
    @message = Message.new
    @users = User.all    
  end


end
