class LocationsController < ApplicationController

  layout nil

  def get_state
    case params[:country]
    when "ru"
      @city = Country.find_by_iso("UA").states
    when "ua"
      @city = Country.find_by_iso("RU").states
    end
  end

end
