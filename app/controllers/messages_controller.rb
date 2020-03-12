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

  def cleanup
    flash[:teal] = "Cleaning done! All messages were deleted."
    respond_to do |format|
      Message.all.each { |message| message.destroy }
      format.js {
        render js: "$('#message-container').load(location.href + ' #each-message');"
      }
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial:'message', locals:{message: message})
  end


end
