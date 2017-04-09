Rails.application.routes.draw do


  get 'events/eventsource'
  get 'events/click'
  get 'events/newpartial', to: 'events#newpartial', as: 'new_events_partial'
  get '/events/:id/editpartial', to: 'events#editpartial', as: 'edit_event_partial'
  resources :events
  get 'calendar/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'event/index'



  root to: "calendar#index"
  # devise_for :users

  # resources :users, only: [:index, :show]
  get 'users/index', to: 'users#index', as: 'users'
  get 'users/:id/edit', to: 'users#edit', as: 'users_edit'
  match 'users/index', to: 'users#create', as: 'createuser', via: [:post]
  resources :users, only: [:show, :update, :destroy, :new]
end
