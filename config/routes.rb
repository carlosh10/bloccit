Rails.application.routes.draw do


  get 'summaries/index'

  get 'summaries/create'

  get 'summaries/new'

  get 'summaries/destroy'

  get 'summaries/show'

  resources :summaries

  devise_for :users
  resources :advertisements, :comments, :questions, :summaries

  resources :topics do
    resources :posts, except: [:index]
  end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
