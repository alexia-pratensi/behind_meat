class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def dashboard
    @assos = Asso.all
    @consos = Conso.all
    @days = Day.all
    @seven_days = Day.first(7)

    # Consommation de boeuf
    # @days.where(user.id == current_user.id)
    @user = current_user.id
    @consos_of_this_user = Day.where(user_id: User.find_by_id(current_user.id)).pluck(:id)
    @boeuf_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('boeuf')).pluck(:quantity).sum
    @boeuf_percent = (@boeuf_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de poulet

    @chicken_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('poulet')).pluck(:quantity).sum
    @chicken_percent = (@chicken_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de porc

    @pork_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('porc')).pluck(:quantity).sum
    @pork_percent = (@pork_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de mouton

    @sheep_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('sheep')).pluck(:quantity).sum
    @sheep_percent = (@sheep_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de poisson

    @fish_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('fish')).pluck(:quantity).sum
    @fish_percent = (@fish_total_conso.to_f / @day_total_conso.to_f * 100).round(2)
  end
end
