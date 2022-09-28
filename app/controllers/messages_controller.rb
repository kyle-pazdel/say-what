class MessagesController < ApplicationController
  before_action do 
    set_conversation
  end

  def index
    @messages = @conversation.messages
    if @messaages.last 
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end
    render template: conversation_messages_path

    @message = conversation.messages.new
  end
    
  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      format.html { redirect_to conversation_messages_path, notice: "Mesage sent!" }
      format.json { render :show, status: :created, location: @message }
    else
      format.html { render :new, notice: "Message failed to send", status: :unprocessable_entity }
      format.json { render json: @message.errors, status: :unprocessable_entity }
    end
  end



    private
      def set_conversation
        @conversation = Conversation.find(params[:conversation_id])
      end

      def message_params
        params.require(:message).permit(:body, :user_id)
      end
end
