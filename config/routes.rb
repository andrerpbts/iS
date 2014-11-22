Rails.application.routes.draw do
  resources :courses, except: [:destroy]
  resources :students, except: [:destroy]
end
