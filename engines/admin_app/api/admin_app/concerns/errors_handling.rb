module AdminApp
  module ErrorsHandling
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound do
        error! { message: { base: I18n.t('errors.messages.record_not_found') } }, 404
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error! { message: e.record.errors }, 422
      end

      rescue_from Errors::Unauthorized do
        error! { message: { base: I18n.t('errors.messages.unauthorized') } }, 401
      end

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error! { message: errors_to_h(e) }, e.status
      end

      private

      def errors_to_h e
        Hash[e.errors.map { |key, value| [(key.length == 1) ? key.first : key, value] }]
      end
    end
  end
end
