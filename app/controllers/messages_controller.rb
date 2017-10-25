class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def show
     @mess = Message.find_by id: params[:id]
     if @mess.seen_at == nil && current_user.email_address == @mess.receiver
        @mess.update seen_at: Time.now
     end
  end

  def create
    @message = Message.new mess_compose_params
    @user = User.find_by email_address: params[:message][:receiver].to_s.downcase.gsub(/\s+/, '')
    if @user
      if @message.save
      flash[:success] = "Gửi thành công"
      redirect_to "/compose"
      else
        flash[:danger] = "Gửi thất bại"
        redirect_to "/compose"
      end
    else
      flash[:danger] = "Người nhận không tồn tại trên hệ thống"
      redirect_to "/compose"
    end
  end
  def mess_compose_params
    params.require(:message).permit(Message::PARAMS_COMPOSE)
  end
end
