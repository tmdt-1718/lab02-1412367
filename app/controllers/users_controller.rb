class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_signup_params
    if @user.save
      flash[:success] = "Signup success"
      redirect_to check_email_address_path
    else
      flash[:danger] = "Signup failed"
      render :new
    end
  end

  def show
     @user = User.find_by id: params[:id]
  end

  def check_email_address
  end

  def confirm_email_address
     @user = User.find_by_confirm_token(params[:token])
    if @user
      @user.update confirm_token: nil, confirmed_at: Time.now
      @user.save(validate: false)
      flash[:success] = "Confirm success"
      redirect_to signup_success_path
    else
      flash[:danger] = "Confirm failed"
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
