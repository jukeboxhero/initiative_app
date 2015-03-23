class SessionsController < ApplicationController

  def create
    if user_url_from_hash
      @user = User.find_or_create_by id: user_id_from_url
      session[:current_user_id] = @user.id
    end
    redirect_to '/'
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end

    def user_url_from_hash
      auth_hash['extra']['raw_info']['url']
    end

    def user_id_from_url
      # Hack day!
      user_url_from_hash.split('/').last.to_i
    end

end