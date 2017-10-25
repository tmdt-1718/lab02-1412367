class DashboardController < ApplicationController

  def inbox
    @mess = Message.order("created_at DESC").where(receiver: current_user.email_address)
  end

  def friends
    @users = User.where.not(id: current_user.id)
  end
end
