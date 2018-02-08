Rails.application.routes.draw do
  get 'board' => 'board#index'

  get 'shortestpath' => 'board#shortest_path'

  root 'board#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
