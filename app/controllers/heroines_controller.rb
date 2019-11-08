class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show]
  
  def index
    @heroines = Heroine.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
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
