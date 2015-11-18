Rails.application.routes.draw do
  mount AdminApp::Engine => '/admin', as: :admin_app

  root to: 'welcome#index'
end
