Rails.application.routes.draw do
  devise_for :owners
  devise_for :agencies

  resources :agencies do #, :path => "agence"
  resources :buildings#, :path => "immeuble"
  end
  resources :owners#, :path => "proprietaire"
  resources :events#, :path => "evenement"
  resources :messages#, :path => "discussions"
  root :to => "landing_pages#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
