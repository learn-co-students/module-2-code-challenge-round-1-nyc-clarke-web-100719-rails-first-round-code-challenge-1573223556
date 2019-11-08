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
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to(@heroine)
    else
      flash[:message] = @heroine.errors.full_messages
      render :new
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  # def update
    
  #   if @heroine.update(heroine_params)
  #     redirect_to @heroine
  #   else
  #   flash[:message] = @heroine.errors.full_messages
  #   render :edit
  #   end
  # end

  private 

  def heroine_params
    params.require(:heroine).permit(:power_id, :name, :super_name)
  end

end
