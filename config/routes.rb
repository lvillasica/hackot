Hackot::Application.routes.draw do
  match "/auth/*callback" => "sessions#create"

  get '/logout' => 'sessions#destroy'

  resources :events, :only => [:index, :show, :create, :update]
  resources :relief_centers, :only => [:index, :show, :update] do
    resources :events, :only => [:index, :show]
  end

  resources :events, :only => [:index, :show] do
    resources :users, :only => [:index]
  end

  resources :users, :only => [:index, :show, :update]

  root :to => 'board#index'
end
