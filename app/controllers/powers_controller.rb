class PowersController < ApplicationController
  before_action :getPower, only: [:show]
  def index
    @powers = Power.all
  end

  def show 
  end

  def new 
    @power = Power.new 
  end

  def create 
    @power = Power.new(powerParams)

    if @power.save
      redirect_to @power
    else
      flash[:error] = @power.errors.full_messages
      render :new
    end
  end






private 
  def getPower
    @power = Power.find(params[:id])
  end

  def powerParams
    params.require(:power).permit(:name, :description)
  end

end
