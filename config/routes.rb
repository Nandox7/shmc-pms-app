Rails.application.routes.draw do
  resources :profiles
  resources :appointments do
    resources :profiles
    resources :patients
  end
	resources :patients do
    resources :appointments
  end
  
    

  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'home#index'

	get '/signedinuserprofile' => 'profiles#signedinuserprofile'

	get :send_patient_email, to: 'patients#send_patient_email', as: :send_patient_email


end
