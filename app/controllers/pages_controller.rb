class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    if current_user.owner
      @chatrooms = Chatroom.where(owner: current_user)
    else
      @chatrooms = Chatroom.where(tenant: current_user)
    end
  end

  def messages
    if current_user.owner
      @chatrooms = Chatroom.where(owner: current_user)
    else
      @chatrooms = Chatroom.where(tenant: current_user)
    end
  end

end
