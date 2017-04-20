Rails.application.routes.draw do


  get 'users/getcalendardate'
  get 'users/setcalendardate'
  get 'users/getcalendartype'
  get 'users/setcalendartype'

  get 'events/eventsource'
  get 'events/click'
  get 'events/newpartial', to: 'events#newpartial', as: 'new_events_partial'
  get 'events/showpartial/:id', to: 'events#showpartial', as: 'event_partial'
  get '/events/:id/editpartial', to: 'events#editpartial', as: 'edit_event_partial'
  resources :events
  get 'calendar/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: 'users#index'

    # , as: :authenticated_root
  end

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end


  # get 'event/index'



  # root 'devise/sessions#new', as: :unauthenticated_root
  # devise_scope :user do
  #   root :to => 'devise/sessions#new'
  # end
  # def after_sign_in_path_for(resource_or_scope)
  #   calendar_index_path
  # end
  #
  # def after_sign_out_path_for(resource_or_scope)
  #   calendar_index_path
  # end

  # devise_for :users

  # resources :users, only: [:index, :show]
  get 'users/index', to: 'users#index', as: 'users'
  get 'users/:id/edit', to: 'users#edit', as: 'users_edit'
  match 'users/index', to: 'users#create', as: 'createuser', via: [:post]
  resources :users, only: [:show, :update, :destroy, :new]
end
