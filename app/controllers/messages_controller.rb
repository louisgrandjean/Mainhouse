class MessagesController < ApplicationController

  def index
    @message = Message.all
  end
  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.building_id = params[:building_id].to_i
    if current_agency
      @message.agency_id = Agency.find_by(id: current_agency.id).id
      @message.sender = Agency.find_by(id: current_agency.id).name

    end
    if current_owner
      @message.owner_id = Owner.find_by(id: current_owner.id).id
      @message.sender = Owner.find_by(id: current_owner.id).first_name
      @message.sender_last = Owner.find_by(id: current_owner.id).last_name
    end

    if @message.save
      redirect_to agency_building_messages_path(params[:agency_id], params[:building_id], params[:id])
    else 
      render :new
    end
  end

  private
  def message_params
    params.permit(:building_id, :content, :agency_id, :sender, :sender_last)
  end

end

