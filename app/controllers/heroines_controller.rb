class HeroinesController < ApplicationController
  before_action :getHeroine, only: [:show]
  def index
    @heroines = Heroine.all
  end

  def show 
  end

  def new 
    @heroine = Heroine.new 
  end

  def create 
    @heroine = Heroine.new(heroineParams)

    if @heroine.save
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      render :new
    end
  end






private 
  def getHeroine
    @heroine = Heroine.find(params[:id])
  end

  def heroineParams
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
