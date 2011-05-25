class LocationsController < ApplicationController
  layout nil

  def get_list
    render :text=>"Hello there!!!!"
  end

  def get_state
    case params[:country]
    when "ru"
      @states = Country.find_by_iso("RU").states
    when "ua"
      @states = Country.find_by_iso("UA").states
    end
  end

end
