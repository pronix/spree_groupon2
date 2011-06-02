module LocationsHelper
  
  # Отображает текущий город
  def current_state
    logger.info "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    if current_user
      unless session[:state_id]
        state = current_user.state
        session[:state_id]=@state.id
      else
        state = State.find_by_id(session[:state_id])
      end
    else
      state = State.first
    end
    state
  end
end