Rails.application.routes.draw do
  resources :users, except: [:delete, :new]
  resources :questions, only: [:index, :show] do
    resources :answers, only: [:index, :show, :new, :create]
  end


  get '/out_of_questions', to: 'static#out_of_questions'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'welcome#home'

end
