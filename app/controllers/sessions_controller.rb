class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by email_address: params[:session][:email_address].to_s.downcase.gsub(/\s+/, '')
    if user && user.authenticate(params[:session][:password])
      if user.confirmed_at==nil
        flash[:warning] = "Please confirm your email first"
        redirect_to login_path
      else
      flash[:success] = "Login success"
      log_in user
      redirect_to user
      end
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
