class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_signup_params
    if @user.save
      redirect_to check_mail_address_path
    else
      render :new
    end
  end

  def check_mail_address
  end

  def confirm_mail_address
    #@user = User.find_by confirm_token: params[:id]
     @user = User.find_by_confirm_token(params[:token])
    if @user
      @user.update confirm_token: nil, confirmed_at: Time.now
      @user.save(validate: false)
      redirect_to signup_success_path
    else
      redirect_to signup_fail_path
    end
  end

  def signup_success
  end

  def signup_fail
  end

  def user_signup_params
    params.require(:user).permit(User::PARAMS_SIGNUP)
  end
end
