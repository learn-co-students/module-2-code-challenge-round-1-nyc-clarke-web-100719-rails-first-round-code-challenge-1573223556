class HeroinesController < ApplicationController
  before_action :this_heroine, only: [:show]

  def index
    @heroines = Heroine.all
  end

  #added below method action in to remind myself that I did it
  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroines_path
    else
      flash[:messages] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def this_heroine
    @heroine = Heroine.find(params[:id])
  end
end
