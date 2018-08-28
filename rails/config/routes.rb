Rails.application.routes.draw do
  resources :vecinos
  devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'vecinos' => 'vecinos#index'
  resource :vecinos
end
