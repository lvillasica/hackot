Hackot::Application.routes.draw do
  match "/auth/*callback" => "sessions#create"

  resources :events, :only => [:index, :show]
  resources :relief_centers, :only => [:index, :show]

  root :to => 'board#index'
end
