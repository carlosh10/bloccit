Rails.application.routes.draw do


  devise_for :users
  resources :advertisements, :comments, :questions

  resources :topics do
    resources :posts, except: [:index]
  end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
