Rails.application.routes.draw do
  root 'users#welcome'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users,
    path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
    controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
    }
  resources :users, only: :show do
    get :trips, on: :member
  end

  resources :locations, only: :index do
    get :get_countries, on: :collection # /locations/get_countries
    get :get_states, on: :collection # /locations/get_states
    get :get_cities, on: :collection # /locations/get_states
    get :to_countries, on: :collection # /locations/to_countries
    get :to_states, on: :collection # /locations/to_states
    get :to_cities, on: :collection # /locations/to_states
  end

  resources :trips do
    get :toggle_status, on: :member
    get :toggle_privacy, on: :member
    resources :schedules, except: %i[show] do
      resources :pictures
      get :overall, on: :collection
    end
  end

  resources :user_spots, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]

  resources :spots, only: %i[index new create]
  resources :countries, only: %i[index]
  resources :states, only: %i[index]
  resources :cities, only: %i[index]
end