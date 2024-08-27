class ConversationsController < ApplicationController
  def index
  	user = User.find(params[:user_id])
  	conversation = Conversation.where(sender: user).or(Conversation.where(receiver: user))
  	render json: conversation
  end

  def create
  	conversation = Conversation.between(conversation_params[:sender_id], conversation_params[:receiver_id]).first
  	if conversation.nil?
  	  conversation = Conversation.create(conversation_params)
  	end

  	render json: conversation
  end

  private

  def conversation_params
  	params.require(:conversation).permit(:sender_id, :receiver_id)
  end
end
