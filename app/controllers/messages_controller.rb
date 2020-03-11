class MessagesController < ApplicationController

  before_action :require_user
  before_action :require_superuser, only: [:cleanup]

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", text_message: message_render(message)
    end
  end

  def index
    @messages = Message.custom_history
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial:'message', locals:{message: message})
  end

  def cleanup
    @messages = Messages.all
    @messages.destroy
    flash[:warning] = "Cleaning done! All messages were deleted."
    redirect_to root_path
  end


end
