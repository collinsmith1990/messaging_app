class MessagesController < ApplicationController

  def show
    @message = Message.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @message = @user.received_messages.build(params[:message])
  end

  def create
    @user = User.find(params[:user_id])
    @message = @user.received_messages.build(message_params)
    if @message.save
      flash[:success] = "Message sent"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def index
    @user = User.find(params[:user_id])
    unless params[:message_type] == "sent"
      @messages = @user.received_messages
    else
      @messages = @user.sent_messages
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :to_id).merge(from_id: current_user.id)
  end
end
