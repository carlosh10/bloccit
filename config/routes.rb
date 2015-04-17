Rails.application.routes.draw do


  resources :posts, :advertisements, :questions

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
