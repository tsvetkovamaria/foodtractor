class CartsController < ApplicationController

  def show
    @cart = current_user.carts.first
  end

  def add
    new_dish = Dish.find(params[:id])
    @cart = current_user.carts.first
    if @cart.nil?
      @cart = current_user.carts.create
    end
    if @cart.cart_items.where(dish_id: new_dish.id).empty?
      @cart.cart_items.create(dish: new_dish, amount: 1)
    else
      old_dish = @cart.cart_items.where(dish_id: new_dish.id).first
      old_dish.increment!(:amount, 1)
    end
    redirect_to :back
  end

end
