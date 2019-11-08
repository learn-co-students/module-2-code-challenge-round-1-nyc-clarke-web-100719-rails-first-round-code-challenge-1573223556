class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show 
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    redirect_to heroines_path
  end

  private 

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
