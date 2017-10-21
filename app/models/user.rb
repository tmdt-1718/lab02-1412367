class User < ActiveRecord::Base
  PARAMS_SIGNUP = [:fullname, :mail_address, :password, :password_confirmation]
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :mail_address, format: {with: EMAIL_REGEX}, uniqueness: true, presence: true
  validates :password, presence: true, length: {minimum: 6, maximum: 20}

  before_create :generate_confirm_token
  after_create :confirm_mail_address

  has_secure_password

  scope :confirmed, ->{where "`users`.`confirm_token` IS NULL AND `users`.`confirmed_at` < ?", Time.now}

  def reset_confirm_token
    generate_confirm_token
    self.save
  end

  private
  def generate_token column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def generate_confirm_token
    generate_token :confirm_token
  end

  def confirm_mail_address
    UserMailer.confirm_user_mail(self).deliver_now
  end
end
