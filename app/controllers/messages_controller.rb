class MessagesController < ApplicationController

skip_before_action :authenticate_user!, only: [:new, :create]

  def new

    @message = Message.new

  end

  def create

    @message = Message.new(message_params)
    @message.statut = "standby"
    @message.traceur = "standby"
    if @message.save
      flash[:notice] = 'Votre message a été soumis à l équipe admin merci !'
      redirect_to pages_messages_path
    else
      flash[:notice] = 'Un problème est survenu ! Si le problème persiste, contactez l équipe'
      redirect_to pages_message_path
    end

  end

  def index

    @messages = Message.all

  end

  def show

  end

  def destroy

  end

  def accept_message

    @message = Message.where(id: mess.id)
    @message.traceur = current_user.id
    @message.statut = "yes"
    @message.save
    redirect_to pages_admin_path

  end

  def refus_message

    @message = Message.where(id: mess.id)
    @message.traceur = current_user.id
    @message.statut = "no"
    @message.save
    redirect_to pages_admin_path

  end

  private

  def message_params
    params.require(:message).permit(:content, :traceur, :statut)
  end

end
