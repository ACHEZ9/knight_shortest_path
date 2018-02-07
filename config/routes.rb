Rails.application.routes.draw do
  get 'board/index'

  get 'shortestpath' => 'board#shortest_path'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
