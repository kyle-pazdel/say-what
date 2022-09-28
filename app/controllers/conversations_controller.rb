class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.find_by(sender_id: params[:sender_id], recipient_id: params[:recipient_id])
      @conversation = Conversation.find_by(sender_id: params[:sender_id], recipient_id: params[:recipient_id])
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end


  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
