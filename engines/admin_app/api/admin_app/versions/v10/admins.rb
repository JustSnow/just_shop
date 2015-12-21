module AdminApp
  module Versions
    class V10::Admins < Grape::API
      resource :admins do
        desc 'List admins'
        get do
        end

        desc 'Edit admin'
        get ':id/edit' do
        end

        desc 'Create admin'
        post do
        end

        desc 'Update admin'
        put :id do
        end
      end
    end
  end
end
