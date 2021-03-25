Rails.application.routes.draw do
  devise_for :owners, controllers: { invitations: 'owners/invitations' }
  devise_for :agencies

  resources :subscriptions, only: [:new, :update]

  resources :agencies do #, :path => "agence"
    resources :buildings do #, :path => "immeuble"
      resources :owners#, :path => "proprietaire"
      resources :events#, :path => "evenement"
      resources :messages#, :path=> "chat"
    end
  end

  root :to => "landing_pages#index"
  get '/agencies/:agency_id/owners', to: 'owners#owners', as: 'all_owners'
  get '/agencies/:agency_id/events', to: 'events#events', as: 'all_events'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
