class Message < ApplicationRecord
  PARAMS_COMPOSE = [:sender, :receiver, :subject, :body]
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :sender, format: {with: EMAIL_REGEX}, presence: true
  validates :receiver, format: {with: EMAIL_REGEX}, presence: true

end
