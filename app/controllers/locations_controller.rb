class LocationsController < ApplicationController

  layout nil

  def get_state
    case params[:country]
    when "ru"
      @states = Country.find_by_iso("UA").states
    when "ua"
      @states = Country.find_by_iso("RU").states
    end
  end

end
