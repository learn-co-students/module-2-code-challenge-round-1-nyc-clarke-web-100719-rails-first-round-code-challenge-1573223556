class PowersController < ApplicationController
  before_action :set_power, only: [:show, :edit, :update, :destroy]


  def index
    @powers = Power.all
  end

  def show
    @heroines = @power.heroines
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)

    if @power.save
      redirect_to @power
    else 
      flash[:messages] = @power.errors.full_messages
      redirect_to new_power_path
    end
  end

  def edit

  end

  def update
    if @power.update(power_params)
      redirect_to @power
    else 
      flash[:messages] = @power.errors.full_messages
      redirect_to edit_power_path(@power)
    end
  end

  def destroy
    @power.destroy

    redirect_to powers_path
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)  
  end

  def set_power
    @power = Power.find(params[:id])
  end

end
