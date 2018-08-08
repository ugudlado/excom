Rails.application.routes.draw do
  resources :clubs
  
  resources :meetings, :path => '/meetings' do
    member do
      post :vote
    end
    member do
      get :activate
    end
  end
  
  resources :members

  root to: 'meetings#next_active'
  post '/meetings/validate_voter_id', to: 'meetings#validate_voter_id'

  devise_scope :member do
    get "/sign_up" => "members#new", :as => "new_member_registration_path" # custom path to sign_up/registration
  end

  devise_for :member, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
