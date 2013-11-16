Hackot::Application.routes.draw do
  match "/auth/*callback" => "sessions#create"

  get '/logout' => 'sessions#destroy'
  resources :events, :only => [:index, :show]
  resources :relief_centers, :only => [:index, :show] do
    resources :events, :only => [:index, :show]
  end
  resources :users, :only => [:index, :show]

  root :to => 'board#index'
end
