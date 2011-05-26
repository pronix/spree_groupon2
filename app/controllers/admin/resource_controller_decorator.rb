Admin::ResourceController.class_eval do

  before_filter :init_states

  private

  # Populate instance variabe with states data
  def init_states
    russia_states = Country.find_by_iso("RU").states
    ukraine_states = Country.find_by_iso("UA").states
    @states = russia_states + ukraine_states
  end

end
