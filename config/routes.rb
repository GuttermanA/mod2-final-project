Rails.application.routes.draw do
  resources :categories, only: [:index] do
    resources :questions, only: [:index], shallow: true do
      resources :answers, only: [:new, :create, :index, :show]
    end
  end
  resources :comments, only: [:index, :create]
  resources :users, except: [:delete, :new]


  get '/categories/:id/question', to: 'questions#show'

  get '/out_of_questions', to: 'static#out_of_questions'
  get '/about', to: 'static#about'
  get '/contact', to: 'static#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'welcome#home'

end
