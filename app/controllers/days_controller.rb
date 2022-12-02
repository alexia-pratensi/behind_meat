class DaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :new, :create, :show]

  def show
    @day = Day.find(params[:id])
    @assos = Asso.all
    @water_impact_show = water_impact_calculator
    @carbon_impact_show = carbon_impact_calculator
    @tree_impact_show = tree_impact_calculator
    @animal_impact_show = animal_impact_calculator
  end

  def new
    @day = Day.new
    @conso = Conso.new
    @meat = Meat.new
  end

  def create
    @day = Day.new
    @day.user_id = current_user.id
    @day.date = Time.now

    # @conso.day_id = @conso
    # @conso = Conso.new(conso_params)
    # @conso.meat_id = @meat
    # @meat = Meat.new(meat_params)

    if @day.save
      create_conso()
      # if params['poulet'].to_i.positive?
      #   @conso = Conso.new
      #   @conso.quantity = params['poulet'].to_i
      #   @conso.meat_id = Meat.find_by_meat_type('poulet').id
      #   @conso.day_id = @day.id
      # end
      redirect_to day_path(@day)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def day_params
  #   params.require(:day).permit(:date)
  # end

  # def conso_params
  #   params.require(:conso).permit(:quantity)
  # end

  # def meat_params
  #   params.require(:meat).permit(:type)
  # end

  def water_impact_calculator
    water_impact_show = 0
    @day.consos.each do |conso|
      # conso.meat.water_impact
      # conso.quantity
      water_impact_show += (conso.quantity * conso.meat.water_impact) / 1000
    end
    return water_impact_show
  end

  def carbon_impact_calculator
    carbon_impact_show = 0
    @day.consos.each do |conso|
      # conso.meat.carbon_impact
      # conso.quantity
      carbon_impact_show += (conso.quantity * conso.meat.carbon_impact) / 1000
    end
    return carbon_impact_show
  end

  def tree_impact_calculator
    tree_impact_show = 0
    @day.consos.each do |conso|
      # conso.meat.tree_impact
      # conso.quantity
      tree_impact_show += (conso.quantity * conso.meat.tree_impact) / 1000
    end
    return tree_impact_show
  end

  def animal_impact_calculator
    animal_impact_show = 0
    @day.consos.each do |conso|
      # conso.meat.animal_impact
      # conso.quantity
      animal_impact_show += (conso.quantity * conso.meat.animal_impact) / 1000
    end
    return animal_impact_show
  end

  def create_conso(meat)
    meat = Meat.find_by_meat_type(meat)
    @conso = Conso.new
    @conso.quantity = params[meat.meat_type].to_i
    @conso.meat_id = meat.id
    @conso.day_id = @day.id
  end
end
