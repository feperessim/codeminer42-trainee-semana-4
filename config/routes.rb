Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id/edit'=> 'users#edit', as: :user_edit
  patch 'users/:id' => 'users#update'
  get 'users/destroy'
  get 'users/:id' => 'users#show', as: :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
