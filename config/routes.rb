Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
 
  resources :doctorappoints
  resources :doctorseeks
  resources :patienttells
  resources :prescriptions
  root "home#index"

  resources :hospitals do
    get 'login', :on => :collection
    post 'signin', :on => :collection
    get 'logout', :on => :collection
    resources :doctors do
    end  
  end
  
    get 'doctors/login'
    post 'doctors/signin'
    get 'doctors/logout'
    get 'doctors/doctordiagnosis'
    get 'patients/prescription'
    get 'patients/previousrecords'
    get 'patients/doctorseeks'
    get 'doctors/previousrecords'
    get 'prescriptions/patienttells'
    get 'patients/profile'

  resources :patients do
    get 'login', :on => :collection
    post 'signin', :on => :collection
    get 'logout', :on => :collection
  end
end
