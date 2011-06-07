class LocationsController < ApplicationController
  layout nil

  def change_state
    state = State.find_by_id(params[:id])
    session[:state_id]=state.id
    redirect_to products_path;
  end

  def get_state
    @issuer = params[:issuer] || 'user'

    case params[:country]
    when "ru"
      @states = Country.find_by_iso("RU").states
    when "ua"
      @states = Country.find_by_iso("UA").states
    end
  end

end
