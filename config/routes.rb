Rails.application.routes.draw do

  devise_for :users
  root 'places#index'

  get 'places/:id/show' => "places#show", :as => :show_place

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
