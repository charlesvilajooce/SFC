Rails.application.routes.draw do


  get 'export_csv/index,'

  get 'export_csv/export'

  resources :terrains
  resources :teams
  resources :matches
  get 'matches/live/:id', to: 'matches#live', as: 'live'
  get 'matches/livemanager/:id', to: 'matches#livemanager', as: 'livemanager'
  match 'matches/createevents', to: 'matches#createevents', as: 'matchevents', via: [:post]
  get 'matches/deleteevents/:id/:matchid', to: 'matches#destroymatchevents', as: 'delete_matchevents'
  get 'matches/deleteevents1users/:id/:matchid', to: 'matches#destroymatchevent1users', as: 'delete_matchevent1users'
  get 'matches/deleteevents2users/:id/:matchid', to: 'matches#destroymatchevent2users', as: 'delete_matchevent2users'
  match 'matches/createevent1users', to: 'matches#createevent1users', as: 'matchevent1users', via: [:post]
  match 'matches/createevent2users', to: 'matches#createevent2users', as: 'matchevent2users', via: [:post]
  get 'game_center/index'

  get 'game_center/live'

  get 'game_center/liveedit'

  get 'media/team'

  get 'public/team'
  get 'public/live/:id', to: 'public#live', as: 'public_live'
  get 'public/effectif2/:whom', to: 'public#effectif2'
  get 'public/player/:alias', to: 'public#player', as: 'public_player'
  get 'public/live'
  get 'public/effectif'

  get 'public/calendar'
  get 'public/currentmatch'
  get 'public/nextmatch'
  get 'public/nextmatches'

  resources :archived_infos
  resources :injuries
  resources :documents
  get 'users/getcalendardate'
  get 'users/setcalendardate'
  get 'users/getcalendartype'
  get 'users/setcalendartype'
  get 'users/changestatus/:id/:status/:wheretoredirect', to: 'users#changestatus', as: 'users_change_status'
  get 'users/oldpics/:id', to: 'users#oldpics', as: 'users_oldpics'

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

  get 'documents/new/:id/:doctype', to: 'documents#new', as: 'new_document_params'


end
