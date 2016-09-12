Rails.application.routes.draw do

  get 'carts/show'

  root 'places#index'

  devise_for :users

  get 'places/:id/show' => "places#show", :as => :show_place

  match "carts/:id/add" => "carts#add", :via => :post, :as => :add_to_cart

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
