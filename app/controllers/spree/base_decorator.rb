Spree::BaseController.class_eval do
  include LocationsHelper
  layout "groupon_application"
  # Отображает текущий город
  helper_method :current_state
end
