module CleanParamsHelpers
  def clean_params params
    ActionController::Parameters.new params
  end
end
