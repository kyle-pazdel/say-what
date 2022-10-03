class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    unless !@messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.update(read: true)
      end
    end

    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_back(fallback_location: conversations_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
