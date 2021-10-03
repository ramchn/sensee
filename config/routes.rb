Rails.application.routes.draw do
  get 'home', to: 'main#index'
  get 'recruiterhome', to: 'main#recruiter'
  get '/main/:id/candidatehome', to: 'main#candidatehome', :as => 'candidatehome'
  put '/jobs/:id/apply', to: 'jobs#apply', :as => 'apply'
  put '/jobs/:id/withdraw', to: 'jobs#withdraw', :as => 'withdraw'
  post '/main/exclusiveapply', to: 'main#exclusiveapply', :as => 'exclusiveapply'
  delete '/main/exclusivewithdraw', to: 'main#exclusivewithdraw', :as => 'exclusivewithdraw'
  resources :main, :jobs, :candidates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
