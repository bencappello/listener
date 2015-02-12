class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user
  wrap_parameters false

  def current_user
    return nil if self.session[:session_token].nil?
    @current_user ||= User.find_by(session_token: self.session[:session_token])
  end

  def sign_in!(user)
    @current_user = user
    @current_user.reset_session_token!
    self.session[:session_token] = @current_user.session_token
  end

  def log_in_guest
    @current_user = User.find_by(username: 'guest')
    @current_user.session_token || @current_user.reset_session_token!
    self.session[:session_token] = @current_user.session_token
  end

  def sign_out!
    current_user.try(:reset_session_token!)
    self.session[:session_token] = nil
  end
end
