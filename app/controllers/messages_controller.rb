class MessagesController < ApplicationController
  before_action :set_conversation, only: [:index, :create]
  before_action :set_group, only: [:create_group_message]

  def index
    messages = @conversation.messages 
    render json: messages
  end

  def create
    user = User.find_by(id: params[:user_id])

    if user.nil?
      render json: { error: "User not found" }, status: :not_found and return
    end

    message = @conversation.messages.new(content: message_params[:content], user_id: user.id)
    if message.save
      render json: message, status: :created
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  def create_group_message
    user = User.find_by(id: params[:message][:user_id])

    if user.nil?
      render json: { error: "User not found" }, status: :not_found and return
    end

    message = @group.messages.new(content: params[:message][:content], user_id: user.id)
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

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
