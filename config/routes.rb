Rails.application.routes.draw do
  root 'users#welcome'
  devise_for :users,
    path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
    controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    }

  resources :users, only: :show do
    get 'dashboard', on: :member #/users/:id/dashboard
  end

  resources :locations, only: :index do
    get 'get_countries', on: :collection # /locations/get_countries
    get 'get_states', on: :collection # /locations/get_states
    get 'get_cities', on: :collection # /locations/get_states
    get 'to_countries', on: :collection # /locations/to_countries
    get 'to_states', on: :collection # /locations/to_states
    get 'to_cities', on: :collection # /locations/to_states
  end

  resources :trips do
    resources :schedules
  end

  resources :user_spots
  resources :spots
  resources :countries, only: [:index]
  resources :states, only: [:index]
  resources :cities, only: [:index]
end