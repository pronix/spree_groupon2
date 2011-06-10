ApplicationController.class_eval do
  layout "groupon_application"

  include LocationsHelper
  helper_method :current_state
end
