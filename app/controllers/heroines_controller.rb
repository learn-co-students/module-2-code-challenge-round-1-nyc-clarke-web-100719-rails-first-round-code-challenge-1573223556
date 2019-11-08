class HeroinesController < ApplicationController
  before_action :getHeroine, only: [:show, :edit, :update]
  def index

    #Ensures spaces in search field are not searched.
    string = params[:power_name]
    string.strip! if string.is_a?(String)
    if string == ""
      params[:power_name] = nil
    end

    @heroines = Heroine.search(params[:power_name])
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

  def edit 

  end

  def update
    @heroine.assign_attributes(heroineParams)

    if @heroine.save
      redirect_to @heroine
    else 
      flash[:error] = @heroine.errors.full_messages
      render :edit
    end
  end





private 
  def getHeroine
    @heroine = Heroine.find(params[:id])
  end

  def heroineParams
    params.require(:heroine).permit(:name, :super_name, :power_id, :power_name)
  end

end
