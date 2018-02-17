Rails.application.routes.draw do
  resources :meetings, :path => 'admin/meetings'
  resources :members, :path => 'admin/members'

  get  '/meetings/active', to: 'meetings#next_active'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
