Rails.application.routes.draw do
  resources :students, except: [:destroy]
end
