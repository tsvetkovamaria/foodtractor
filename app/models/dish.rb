class Dish < ApplicationRecord
  
  belongs_to :place
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  has_attached_file :image, 
                    styles: { medium: "300x300>", thumb: "100x100>" }, 
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
