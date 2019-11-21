Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]

  resources :locations, only: :index do
    get 'get_states', on: :collection # /locations/get_states
    get 'get_cities', on: :collection # /locations/get_states
  end
end
