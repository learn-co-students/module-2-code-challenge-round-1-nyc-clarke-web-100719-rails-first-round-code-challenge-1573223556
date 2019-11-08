class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show]
  
  def index
    if params[:q] && !params[:q].empty?
      @heroines = Heroine.select{|heroine| heroine.power.name == params[:q]}
      if @heroines.size == 0 
        @no_found = true
      end
    else
    @heroines = Heroine.all
    end
  end

  def show
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      flash[:msg] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name,:super_name,:power_id)
  end

end
