class LocationsController < ApplicationController

  layout nil

  def get_city
    case params[:country]
    when "ru"
      @city = Country.find_by_iso("UA").regions
    when "ua"
      @city = Country.find_by_iso("RU").regions
    end
  end

end
