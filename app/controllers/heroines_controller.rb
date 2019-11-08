class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = Heroine.all?

    # if params[:search]
    # end

    render :index
  end

  def new
    @heroine = Heroine.new
    render :new
  end

  def create
    @heroine = Heroine.create(heroine_params)

    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:messages] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @heroine.update(heroine_params)
      redirect_to heroine_path(@heroine)
    else
      flash[:messages] = @heroine.errors.full_messages
      redirect_to edit_heroine_path
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
