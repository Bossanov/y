class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about,:charte, :messages, :pourquoi, :fonctionnement, :mentions_legales]
  def home
  end

  def about
  end

  def charte
  end

  def messages
  end

  def pourquoi
  end

  def admin
  end

  def fonctionnement
  end

  def mentions_legales
  end

end
