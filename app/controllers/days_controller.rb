require 'date'

class DaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def show
    @assos = Asso.all
    @day = Day.find(params[:id])
    @water_impact_show = water_impact_calculator
    @carbon_impact_show = carbon_impact_calculator
    @tree_impact_show = tree_impact_calculator
    @pollution_impact_show = pollution_impact_calculator

    # Consommation de boeuf

    @boeuf_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('boeuf').id).where(day_id: @day.id).pluck(:quantity).sum
    @day_total_conso = @day.consos.pluck(:quantity).sum
    @boeuf_percent = (@boeuf_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de poulet

    @chicken_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('poulet').id).where(day_id: @day.id).pluck(:quantity).sum
    @day_total_conso = @day.consos.pluck(:quantity).sum
    @chicken_percent = (@chicken_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de porc

    @pork_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('porc').id).where(day_id: @day.id).pluck(:quantity).sum
    @day_total_conso = @day.consos.pluck(:quantity).sum
    @pork_percent = (@pork_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de mouton

    @sheep_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('mouton').id).where(day_id: @day.id).pluck(:quantity).sum
    @day_total_conso = @day.consos.pluck(:quantity).sum
    @sheep_percent = (@sheep_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de poisson

    @fish_total_conso = Conso.where(meat_id: Meat.find_by_meat_type('poisson').id).where(day_id: @day.id).pluck(:quantity).sum
    @day_total_conso = @day.consos.pluck(:quantity).sum
    @fish_percent = (@fish_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # @sum_total = conso_donut('chicken') + conso_donut('beef') + conso_donut('pork') + conso_donut('sheep') + conso_donut('fish')
    # @total_beef = conso_donut('beef') * 100 / @sum_total
    # @total_chicken = conso_donut('chicken') * 100 / @sum_total
    # @total_pork = conso_donut('pork') * 100 / @sum_total
    # @total_sheep = conso_donut('sheep') * 100 / @sum_total
    # @total_fish = conso_donut('fish') * 100 / @sum_total
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new
    @day.user_id = current_user.id
    @date = Date.parse(params[:day][:date])
    @day.date = @date
    # @conso.day_id = @conso
    # @conso = Conso.new(conso_params)
    # @conso.meat_id = @meat
    # @meat = Meat.new(meat_params)

    if @day.save
      # if params['poulet'].to_i.positive?
      #   @conso = Conso.new
      #   @conso.quantity = params['poulet'].to_i
      #   @conso.meat_id = Meat.find_by_meat_type('poulet').id
      #   @conso.day_id = @day.id
      # end
      Meat.pluck(:meat_type).each do |meat|
        create_conso(meat)
      end
      render(json: @day)
      # create_conso
      #
      # respond_to do |format|
      #   format.html @day.id
      #   format.text puts 'text response !!!!!!!!!!!'
      # end
    else
      render :new, status: :unprocessable_entity
    end

  def edit
    @day = Day.find(params[:id])
    @boeuf = 0
    @poulet = 0
    @porc = 0
    @poisson = 0
    @mouton = 0
    @day.consos.each do |conso|
      case conso.meat.meat_type
      when "boeuf"
        @boeuf += conso.quantity
      when "poulet"
        @poulet += conso.quantity
      when "porc"
        @porc += conso.quantity
      when "poisson"
        @poisson += conso.quantity
      when "mouton"
        @mouton += conso.quantity
      end
    end

  end

  def update
    @day = Day.find(params[:id])

    @day.update(day_params)
    redirect_to day_path(@day)
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
    return water_impact_show.round(2)
  end

  def carbon_impact_calculator
    carbon_impact_show = 0
    @day.consos.each do |conso|
      # conso.meat.carbon_impact
      # conso.quantity
      carbon_impact_show += (conso.quantity * conso.meat.carbon_impact) / 1000
    end
    return carbon_impact_show.round(2)
  end

  def tree_impact_calculator
    tree_impact_show = 0
    @day.consos.each do |conso|
      # conso.meat.tree_impact
      # conso.quantity
      tree_impact_show += (conso.quantity * conso.meat.tree_impact) / 1000
    end
    return tree_impact_show.round(2)
  end

  def pollution_impact_calculator
    pollution_impact_show = 0
    @day.consos.each do |conso|
      # conso.meat.pollution_impact
      # conso.quantity
      pollution_impact_show += (conso.quantity * conso.meat.pollution_impact) / 1000
    end
    return pollution_impact_show.round(2)
  end

  def create_conso(meat)
    @conso = Conso.new
    @conso.quantity = params[meat].to_i
    @conso.meat_id = Meat.find_by_meat_type(meat).id
    @conso.day_id = @day.id
    @conso.save
  end

  # def conso_donut(meat)
  #   @conso = Conso.new
  #   @conso.quantity = params[meat].to_i
  #   puts params[meat].to_i
  #   @conso.meat_id = Meat.find_by_meat_type(meat).id

  # end
  def day_params
    params.require(:day).permit(:date)
  end

end
