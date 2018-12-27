Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  #get 'reports/research'
  get '/reports/research(/:begin)(/:end)', to: 'reports#research', as: 'research'
  #get 'report/index'
  #get 'reports', controller: 'reports', action: 'index'
  #get 'reports/:date_end', controller: 'reports', action: 'show'
  get 'new_protocol/:id' => 'attempts#new_protocol', :as => 'attempts_protocol'
  resources :reports
  resources :attempts
  resources :records
  resources :age_ranges
  resources :observations
  resources :workers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end