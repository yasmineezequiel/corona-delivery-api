Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'v1/auth'
  namespace :v1 do
    resources :orders, only: %i[:create, :index, :update] do 
    end
  end
end