Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    get 'get_states', on: :collection # /users/get_states
    get 'get_cities', on: :collection # /users/get_states
  end
end
