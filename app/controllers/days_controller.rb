class DaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :new, :create, :show]

  def show
    @assos = Asso.all
    @day = Day.find(params[:id])
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
      # create_conso
      # if params['poulet'].to_i.positive?
      #   @conso = Conso.new
      #   @conso.quantity = params['poulet'].to_i
      #   @conso.meat_id = Meat.find_by_meat_type('poulet').id
      #   @conso.day_id = @day.id
      # end
      #
      # respond_to do |format|
      #   format.html @day.id
      #   format.text puts 'text response !!!!!!!!!!!'
      # end
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

  def create_conso
    meat = Meat.find_by_meat_type(meat)
    @conso = Conso.new
    @conso.quantity = params[meat.meat_type].to_i
    @conso.meat_id = meat.id
    @conso.day_id = @day.id
  end
end
