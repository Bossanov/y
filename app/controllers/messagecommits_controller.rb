class MessagecommitsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]

  def new

    @messagecommit = Messagecommit.new

  end

  def create

    @messagecommit = Messagecommit.new(messagecommit_params)
    @message = Message.where(id: @messagecommit.message_id)
    @messagecommit.statut = "standby"
    @messagecommit.traceur = "standby"
    if @messagecommit.save
      flash[:notice] = 'Votre commentaire a été soumis à l équipe admin merci !'
      redirect_to new_messagecommit_path(@messagecommit.id)
    else
      flash[:notice] = 'Un problème est survenu ! Si le problème persiste, contactez l équipe'
      redirect_to new_messagecommit_path(@messagecommit.id)
    end

  end

  def index

    @messagecommits = Message.all

  end

  def show

  end

  def destroy

  end

  def accept_messagecommit

    @messagecommit = Messagecommit.where(id: mess.id)
    @messagecommit.traceur = current_user.id
    @messagecommit.statut = "yes"
    @messagecommit.save
    redirect_to pages_admin_path

  end

  def refus_messagecommit

    @messagecommit = Messagecommit.where(id: mess.id)
    @messagecommit.traceur = current_user.id
    @messagecommit.statut = "no"
    @messagecommit.save
    redirect_to pages_admin_path


  end

  private

  def messagecommit_params
    params.require(:message).permit(:content, :traceur, :statut)
  end

end
