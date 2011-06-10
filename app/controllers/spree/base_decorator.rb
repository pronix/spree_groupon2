Spree::BaseController.class_eval do

  layout :groupon_application

  include LocationsHelper
  helper_method :current_state
  private
  def groupon_application
    "groupon_application"
  end
end
