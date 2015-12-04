AdminApp::Engine.routes.draw do
  # TODO fix routes and paths
  devise_for :users,
    controllers: {
      sessions: 'user/sessions'
    },
    class_name: 'AdminApp::User'

  # TODO fix path for engine and contollers
  devise_scope :user do
    get :sign_in, to: 'user/sessions#new', as: :login
  end

  root to: 'welcome#index'
end
