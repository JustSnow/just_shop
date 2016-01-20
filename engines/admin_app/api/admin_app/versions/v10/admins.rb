module AdminApp
  module Versions
    class V10::Admins < Grape::API
      helpers do
        params :pagination do
          optional :page, type: Integer
        end

        params :admin do
          group :admin, type: Hash do
            requires :email, type: String
            requires :password, type: String
            requires :password_confirmation, type: String
          end
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
          use :admin
        end

        post do
          form = AdminForm.new Admin.new, permitted_params
          form.save!

          present form, with: Entities::Admin
        end

        route_param :id do
          desc 'Show admin'
          get do
            present admin, with: Entities::Admin
          end

          desc 'Update admin'
          params do
            use :admin
          end

          put do
            form = AdminForm.new admin, permitted_params
            form.save!

            present form, with: Entities::Admin
          end

          desc 'Delete admin'
          delete do
            admin.destroy
            present admin, with: Entities::Admin
          end
        end
      end
    end
  end
end
