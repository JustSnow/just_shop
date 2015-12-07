AdminApp::Engine.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'admin_app/user/sessions'
    },
    class_name: 'AdminApp::User',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'registration'
    }

  root to: 'welcome#index'
end
