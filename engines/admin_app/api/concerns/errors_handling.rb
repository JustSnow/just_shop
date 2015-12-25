module ErrorsHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      error_response message: { base: I18n.t('errors.messages.record_not_found') }, status: 404
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error_response message: e.record.errors, status: 422
    end

    rescue_from Errors::Unauthorized do
      error_response message: { base: I18n.t('errors.messages.unauthorized') }, status: 401
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error_response message: errors_to_h(e), status: e.status
    end

    private

    def errors_to_h e
      Hash[e.errors.map { |key, value| [(key.length == 1) ? key.first : key, value] }]
    end
  end
end
