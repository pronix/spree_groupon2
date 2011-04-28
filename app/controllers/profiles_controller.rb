class ProfilesController < ApplicationController
  include SpreeBase
  helper :users, 'spree/base'

  def edit
    @profile = if params[:email]
                 User.find_by_email(params[:email]).profile
              else
                Profile.find(params[:id])
              end
  end

  def update
    @profile = Profile.find(params[:profile][:id])
    if @profile.update_attributes(params[:profiles])
      redirect_to root_path
    else
      render :action => "edit"
    end
  end

end
