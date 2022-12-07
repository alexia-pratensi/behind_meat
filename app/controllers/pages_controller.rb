class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def dashboard
    @assos = Asso.all
    @consos = current_user.consos
    @days = Day.where(user_id: current_user.id)
    @seven_days = @days.first(7)
    @last_day = @days.last

    # Consommation de boeuf
    # @days.where(user.id == current_user.id)

    @beef_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('boeuf')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @beef_percent = (@beef_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Consommation de poulet

    @chicken_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('poulet')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @chicken_percent = (@chicken_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Consommation de porc

    @pork_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('porc')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @pork_percent = (@pork_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Consommation de mouton

    @sheep_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('mouton')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @sheep_percent = (@sheep_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Consommation de poisson

    @fish_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('poisson')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @fish_percent = (@fish_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Cards

    @water_impact_dashboard = water_impact_calculator
    @carbon_impact_dashboard = carbon_impact_calculator
    @tree_impact_dashboard = tree_impact_calculator
    @pollution_impact_dashboard = pollution_impact_calculator


  end

  private

    # Algorithme Cards

  def water_impact_calculator
    water_impact_dashboard = 0
    @consos.each do |conso|
      # conso.meat.water_impact
      # conso.quantity
      water_impact_dashboard += (conso.quantity * conso.meat.water_impact) / 1000
    end
    return water_impact_dashboard.round(2)
  end

  def carbon_impact_calculator
    carbon_impact_dashboard = 0
    @consos.each do |conso|
      # conso.meat.carbon_impact
      # conso.quantity
      carbon_impact_dashboard += (conso.quantity * conso.meat.carbon_impact) / 1000
    end
    return carbon_impact_dashboard.round(2)
  end

  def tree_impact_calculator
    tree_impact_dashboard = 0
    @consos.each do |conso|
      # conso.meat.tree_impact
      # conso.quantity
      tree_impact_dashboard += (conso.quantity * conso.meat.tree_impact) / 1000
    end
    return tree_impact_dashboard.round(2)
  end

  def pollution_impact_calculator
    pollution_impact_dashboard = 0
    @consos.each do |conso|
      # conso.meat.pollution_impact
      # conso.quantity
      pollution_impact_dashboard += (conso.quantity * conso.meat.pollution_impact) / 1000
    end
    return pollution_impact_dashboard.round(2)
  end


end
