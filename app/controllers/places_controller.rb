class PlacesController < ApplicationController

  before_action :authenticate_user!

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @cart = current_user.carts.first
    if @cart.nil?
      @cart = current_user.carts.create
    end
    
  end

end
