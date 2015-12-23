module AdminApp
  module Versions
    class V10::Admins < Grape::API
      helpers do
        params :pagination do
          optional :page, type: Integer
        end

        # TODO add config for store settings
        def admins
          @admins ||= Admin.all.paginate page: params[:page], per_page: 1
        end

        def admin
          @admin ||= Admin.find params[:id]
        end
      end

      resource :admins do
        desc 'List admins'
        params do
          use :pagination
        end

        get do
          present :total_pages, admins.total_pages
          present :next_page?, admins.next_page.present?
          present admins, with: Entities::Admin
        end

        desc 'Create admin'
        post do
        end

        route_param :id do
          desc 'Show admin'
          get do
            present admin, with: Entities::Admin
          end

          desc 'Update admin'
          put do
          end

          desc 'Delete admin'
          delete do
          end
        end
      end
    end
  end
end
