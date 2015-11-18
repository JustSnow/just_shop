AdminApp::Engine.routes.draw do
  # TODO fix routes and paths
  devise_for :admin_users,
    controllers: {
      sessions: 'admin_user/sessions'
    }

  devise_scope :admin_user do
    get :sign_in, to: 'admin_user/sessions#new', as: :login
  end

  root to: 'welcome#index'
end
