class ChatroomController < ApplicationController

  before_action :require_user, except: [:welcome]

  def index
    @status_list = [["Online","green"], ["Busy","red"], ["Away","yellow"]]
    @messages = Message.custom_display
    @message = Message.new
    @users = User.all
  end

  def about
  end


end
