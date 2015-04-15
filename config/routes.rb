Rails.application.routes.draw do


  resources :posts, :advertisements

  get 'about' => 'welcome#about'

  root to: 'posts#index'

end
