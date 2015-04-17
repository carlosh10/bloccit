Rails.application.routes.draw do


  devise_for :users
  resources :posts, :advertisements, :questions

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
