AdminApp::Engine.routes.draw do
  devise_for :admins,
    skip: %w(sessions registrations confirmations unlocks),
    class_name: 'AdminApp::Admin'

  as :admin do
    get 'login' => 'admin/sessions#new', as: :new_admin_session
    post 'login' => 'admin/sessions#create', as: :admin_session
    delete 'logout' => 'admin/sessions#destroy', as: :destroy_admin_session
  end

  root to: 'welcome#index'

  resources :admins, except: [:show]
  resources :users, except: [:show]
end
