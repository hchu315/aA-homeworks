class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user


  #sets current user to the user arg, resets user sess token but why?
  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

#find current user by using their sess token to look them up
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

#should change current user to nil, reset token?
  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end
end
