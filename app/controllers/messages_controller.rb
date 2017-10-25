class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def show
     @mess = Message.find_by id: params[:id]
  end

  def create
    @message = Message.new mess_compose_params
    if @message.save
      flash[:success] = "Send success"
      redirect_to "/compose"
    else
      flash[:danger] = "Send failed"
      redirect_to "/compose"
    end
  end
  def mess_compose_params
    params.require(:message).permit(Message::PARAMS_COMPOSE)
  end
end
