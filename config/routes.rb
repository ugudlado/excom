Rails.application.routes.draw do
  resources :meetings, :path => 'admin/meetings' do
    member do
      post :vote
    end
  end
  
  resources :members, :path => 'admin/members'

  get  '/current', to: 'meetings#next_active'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
