Rails.application.routes.draw do

  resources :categories, except: [:show]
  resources :ideas, except: [:index, :edit]
  root 'ideas#index'

end
