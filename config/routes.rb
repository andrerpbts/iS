Rails.application.routes.draw do

  resources :courses, except: [:destroy]
  resources :students, except: [:destroy] do
    resources :classrooms, only: [:new, :create]
  end
end
