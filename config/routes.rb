Rails.application.routes.draw do
  devise_for :owners
  devise_for :agencies

  resources :agencies do #, :path => "agence"
    resources :buildings do #, :path => "immeuble"
      resources :owners#, :path => "proprietaire"
      resources :events#, :path => "evenement"
    end
  end

  resources :messages#, :path => "discussions"
  root :to => "landing_pages#index"
  get '/agencies/:agency_id/owners', to: 'owners#owners', as: 'all_owners'
  get '/agencies/:agency_id/events', to: 'events#events', as: 'all_events'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
