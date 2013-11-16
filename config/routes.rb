Hackot::Application.routes.draw do
  match "/auth/*callback" => "sessions#create"
  root :to => 'board#index'
end
