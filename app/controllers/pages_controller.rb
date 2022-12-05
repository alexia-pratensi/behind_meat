class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def dashboard
    @assos = Asso.all
    @consos = Conso.all
    @days = Day.all
    @seven_days = Day.first(7)
  end
end
