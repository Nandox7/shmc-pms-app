Rails.application.routes.draw do
  resources :appointments
  resources :profiles
	resources :patients

  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'home#index'

	get '/signedinuserprofile' => 'profiles#signedinuserprofile'
end
