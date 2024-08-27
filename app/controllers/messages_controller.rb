class MessagesController < ApplicationController
  before_action :set_conversation, only: [:index, :create]

  def index
  	messages = @conversation.messages 
  	render json: messages
  end

  def create
  	message = @conversation.messages.new(message_params)
  	message.user_id = params[:user_id]
  	if message.save
  	  render json: message, status: :created
  	else
  	  render json: message.errors, status: :unprocessable_entity
  	end
  end


  private

  def set_conversation
  	@conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
  	unless @conversation
  	  @conversation = Conversation.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
  	end
  end

  def message_params
  	params.require(:message).permit(:content)
  end
end
