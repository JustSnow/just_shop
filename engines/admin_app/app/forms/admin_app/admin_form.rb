module AdminApp
  class AdminForm < BaseForm
    validates :password, confirmation: true

    def self.permitted_params
      [
        :email, :password, :password_confirmation, :first_name, :last_name,
        :role
      ]
    end

    private

    def persist!
      if model.new_record?
        model.create form_attributes
      else
        model.update_attributes form_attributes
      end
    end
  end
end
