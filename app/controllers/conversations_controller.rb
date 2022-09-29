class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  # def new
  # end

  def create
    if Conversation.find_by({sender_id: params[:sender_id]} && {recipient_id: params[:recipient_id]}).present?
      @conversation = Conversation.find_by({sender_id: params[:sender_id]} && {recipient_id: params[:recipient_id]})
    elsif Conversation.find_by({sender_id: params[:recipient_id]} && {recipient_id: params[:sender_id]}).present?
      @conversation = Conversation.find_by({sender_id: params[:sender_id]} && {recipient_id: params[:recipient_id]})
    else
      @conversation = Conversation.create(sender_id: params[:sender_id], recipient_id: params[:recipient_id])
    end
    redirect_to conversation_messages_path(@conversation)
  end


  # private
  #   def conversation_params
  #     params.require(:conversation).permit(:sender_id, :recipient_id)
  #   end
end
