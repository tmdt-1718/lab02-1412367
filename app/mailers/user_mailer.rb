class UserMailer < ApplicationMailer
  def confirm_user_email user
    @user ||= user
    mail(to: user.email_address, subject: "Confirm Your Account") if user.email_address?
  end
end
