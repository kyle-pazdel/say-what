class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @users = User.all
    @conversations = Conversation.all
    @conversation = Conversation.find_by(id: params[:id])
    unless !@conversation&.messages&.last 
      if @conversation.messages.last.user_id != current_user.id
        @conversation.messages.last.update(read: true)
      end
    end
  end

  def show 
    @conversation = Conversation.find(params[:id])
    
    unless !@conversation.messages.last 
      if @conversation.messages.last.user_id != current_user.id
        @conversation.messages.last.update(read: true)
      end
    end
    @message = @conversation.messages.new

  end


  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
     redirect_to controller: "conversations", action: "create", id: @conversation.id
  end

  def destroy
    @conversation = Conversation.find_by(id: params[:id])
    @conversation.destroy
    redirect_to controller: "conversations", action: "index"
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
