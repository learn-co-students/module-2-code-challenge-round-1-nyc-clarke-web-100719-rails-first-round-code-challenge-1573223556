class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show, :edit, :update, :destroy]
  def index
    @heroines = Heroine.all
  end

  def show 
  end

  def new
    @heroine = Heroine.new
  end

  def edit
  end

  def update
    
    if Heroine.update(heroine_params)
      
      redirect_to heroine_path(@heroine)
    else 
      flash[:messages] = @heroine.errors.full_messages

      redirect_to edit_heroine_path(@heroine)
    end
  end
  
  def create
    @heroine = Heroine.new(heroine_params)

    if @heroine.valid?
      @heroine = Heroine.create(heroine_params)
      
      redirect_to heroine_path(@heroine)
    else 
      flash[:messages] = @heroine.errors.full_messages

      redirect_to new_heroine_path(@heroine)
    end

  end

  def destroy
    @heroine.destroy

    redirect_to heroines_path
  end

  private 

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

end
