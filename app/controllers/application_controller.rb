class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def current_user
      @cu ||= User.find_by_id session[:current_user_id]
    end
    helper_method :current_user

    def redirect_unless_logged_in?
      unless session[:current_user_id]
        redirect_to '/auth/yammer'
      end
    end

end
