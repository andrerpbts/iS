Rails.application.routes.draw do

  root to: 'students#index'

  resources :courses, except: [:destroy]
  resources :students, except: [:destroy] do
    resources :classrooms, only: [:new, :create]
  end
end
