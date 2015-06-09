Rails.application.routes.draw do


  get 'comments/new'
  get 'comments/show'
  get 'comments/edit'

  devise_for :users
  resources :advertisements, :comments, :questions
  resources :users, only: [:update]

# testar pra ver se funciona esse nesting
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end



  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
