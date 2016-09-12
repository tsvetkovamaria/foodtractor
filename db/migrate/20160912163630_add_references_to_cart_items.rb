class AddReferencesToCartItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :cart_items, :dish, foreign_key: true
    add_reference :cart_items, :cart, foreign_key: true
  end
end
