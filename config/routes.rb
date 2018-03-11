Rails.application.routes.draw do
  resources :meetings, :path => '/meetings' do
    member do
      post :vote
    end
    member do
      get :activate
    end
  end
  
  resources :members, :path => '/members'

  get  '/', to: 'meetings#next_active'
  post '/meetings/validate_voter_id', to: 'meetings#validate_voter_id'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
