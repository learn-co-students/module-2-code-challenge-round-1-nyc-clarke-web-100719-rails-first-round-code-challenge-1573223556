Rails.application.routes.draw do
  resources :powers, only: [:index, :new, :create, :show, :edit, :update, :destroy ]
  resources :heroines, only: [:index, :new, :create, :show, :edit, :update, :destroy ]
end
