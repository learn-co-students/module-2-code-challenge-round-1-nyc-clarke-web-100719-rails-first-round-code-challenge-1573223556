class PowersController < ApplicationController
  before_action :this_power, only: [:show]

  def index
    @powers = Power.all
  end

  #ditto as last time
  def show
  end

 

  private
  
  def this_power
    @power = Power.find(params[:id])
  end
end
