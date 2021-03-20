Rails.application.routes.draw do
  devise_for :owners
  devise_for :agencies

  resources :agencies do #, :path => "agence"
    resources :buildings do #, :path => "immeuble"
      resources :owners#, :path => "proprietaire"
    end
  end

  resources :events#, :path => "evenement"
  resources :messages#, :path => "discussions"
  root :to => "landing_pages#index"
  get '/agencies/:agency_id/owners', to: 'owners#owners', as: 'all_owners'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
