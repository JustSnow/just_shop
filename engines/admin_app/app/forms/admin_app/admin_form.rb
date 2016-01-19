module AdminApp
  class AdminForm < BaseForm
    attr_accessor :email, :role, :password, :password_confirmation, :first_name,
      :last_name

    validates :password, confirmation: true

    def self.permitted_params
      [
        :email, :password, :password_confirmation, :first_name, :last_name,
        :role
      ]
    end

    private

    def persist!
      model.update_attributes form_attributes
    end
  end
end
