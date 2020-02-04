class ChatroomController < ApplicationController

  def index
    @messages = Message.all
    @user = User.all
  end


end
