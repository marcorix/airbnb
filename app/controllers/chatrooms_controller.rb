class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    # Check if the chatroom already exist
    @owner = User.find(params[:chatroom][:owner_id])
    @chatrooms = Chatroom.where(owner: @owner, tenant: current_user)

    if @chatrooms.empty?
      puts "nooooo"
      @owner = User.find(params[:chatroom][:owner_id])
      @flat = Flat.find(params[:chatroom][:flat_id])
      @chatroom = Chatroom.new(name: @flat.name, owner: @owner, tenant: current_user)

      if @chatroom.save!
        redirect_to chatroom_path(@chatroom)
      else
        render 'flats/show', status: :unprocessable_entity
      end

    else
      puts "yesss"
      redirect_to chatroom_path(@chatrooms.first)
    end

  end
end
