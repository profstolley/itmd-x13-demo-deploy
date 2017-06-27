Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'auth/:provider/callback', to: 'sessions#create', via: [:post,:get]
  get 'login', to: 'sessions#login', as: 'login'
  get 'logout', to: 'sessions#logout', as: 'logout'
  get 'auth/github', as: 'github_login'
end
