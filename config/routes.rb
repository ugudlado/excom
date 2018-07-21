Rails.application.routes.draw do
  resources :meetings, :path => '/meetings' do
    member do
      post :vote
    end
    member do
      get :activate
    end
  end
  
  resources :members, :path => '/admin/members'

  root to: 'meetings#next_active'
  post '/meetings/validate_voter_id', to: 'meetings#validate_voter_id'

  devise_scope :user do
    get "/sign_up" => "members#new", as: "new_member_registration" # custom path to sign_up/registration
    get "/edit" => "members#edit", as: "edit_member_registration" # custom path to sign_up/registration
  end

  devise_for :members

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
