module AdminApp
  module Versions
    class V10::Admins < Grape::API
      helpers do
        params :pagination do
          optional :page, type: Integer
        end

        def admins
          @admins ||= Admin.all.paginate \
            page: params[:page],
            per_page: Settings.admin.pagination.admins
        end

        def admin
          @admin ||= Admin.find params[:id]
        end

        def permitted_params
          clean_params(params).require(:admin).permit *AdminForm.permitted_params
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
        params do
          group :admin, type: Hash do
            requires :email, type: String
            requires :password, type: String
            requires :password_confirmation, type: String
            optional :first_name, type: String
            optional :last_name, type: String
            optional :role, type: String
          end
        end
        post do
          form = AdminForm.new Admin.new, permitted_params
          form.save
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
            admin.destroy
          end
        end
      end
    end
  end
end
