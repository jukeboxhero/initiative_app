class SearchController < ApplicationController

  before_filter :user, :only => :index

	def index
		if user && user.initiative
      redirect_to initiative_path(user.initiative, :uid => user.id)
    end
	end

  def autocomplete
    model = params[:model] || "user"
    query = "autocomplete:#{model}:#{params[:q]}"
    res = Rails.cache.fetch query
    unless res
      res = Yammer.autocomplete :prefix => params[:q], :models => "#{model}:5"
      res = res.body[model.to_sym]
      Rails.cache.write query, res, :expires_in => 1.hour
    end
    render json: res
  end

  private

    def user
      @user ||= User.find_or_create_by id: params[:user_id]
    end

end
