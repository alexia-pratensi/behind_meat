class DaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :new, :create, :show]

  def show
    @day = Day.find(params[:id])
  end

  def new
    @day = Day.new
    @conso = Conso.new
    @meat = Meat.new
  end

  def create
    @day = Day.new(day_params)
    @conso.day_id = @conso
    @conso = Conso.new(conso_params)
    @conso.meat_id = @meat
    @meat = Meat.new(meat_params)

    if @day.save && @conso.save && @meat.save
      redirect_to day_path(@day)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def day_params
    params.require(:day).permit(:date)
  end

  def conso_params
    params.require(:conso).permit(:quantity)
  end

  def meat_params
    params.require(:meat).permit(:type)
  end

end
