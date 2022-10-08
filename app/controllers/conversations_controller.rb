class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @users = User.all
    @conversations = Conversation.all.sort_by { |conversation| conversation.messages.last.created_at }
    # @conversations = conversations_sort(@conversations)
    # WORKING ON SORT ALGORITHM
    ## Having an issue sorting conversations if the conversation does not have any exiting messages.

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
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
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

  def conversations_sort(conversations)
    n = conversations.length - 1
    n.times do |i|
      min_index = i
      for j in (i + 1)..n
        min_index = j if conversations[j].messages.last.created_at > conversations[min_index].messages.last.created_at
      end
      conversations[i], conversations[min_index] = conversations[min_index], conversations[i] if min_index
    end
    conversations
  end

  def bubble_sort(conversations)
    return conversations if conversations.size <= 1
    swapped = true
    while swapped
      swapped = false
      0.upto(conversations.size - 2) do |i|
        if conversations.messages.last.created_at[i] > conversations.messages.last.created_at[i + 1]
          conversations[i], conversations[i + 1] = conversations[i + 1], conversations[i]
          swapped = true
        end
      end
    end

    conversations
  end
end
