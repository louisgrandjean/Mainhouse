Rails.application.routes.draw do
  devise_for :owners
  devise_for :agencies

  resources :agencies#, :path => "agence"
  resources :buildings#, :path => "immeuble"
  resources :owners#, :path => "proprietaire"
  resources :events#, :path => "evenement"
  resources :messages#, :path => "discussions"

  # a terme : mettre la root vers la _static ou _landing, non ?
  root to: "buildings#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
