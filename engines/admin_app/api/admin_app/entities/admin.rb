module AdminApp
  module Entities
    class Admin < Grape::Entity
      root :admins, :admin

      expose :id
      expose :email
      expose :first_name
      expose :last_name
      expose :name
      expose :role

      expose :created_at
      expose :updated_at
    end
  end
end
