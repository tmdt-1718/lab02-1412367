class UserMailer < ApplicationMailer
  def confirm_user_mail user
    @user ||= user
    mail(to: user.mail_address, subject: "Confirm Your Account") if user.mail_address?
  end
end
