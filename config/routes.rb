Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end
  namespace :project do
    resources :tasks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
