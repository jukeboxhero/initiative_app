class InitiativesController < ApplicationController

  respond_to :html, :json

  before_filter :initiative, except: [:index, :new, :create]

  after_filter :send_activity_stream, only: :add_myself

  def index
    if params[:tag]
      @initiatives = Initiative.tagged_with(params[:tag])
    elsif params[:q]
      @initiatives = Initiative.where ["name ILIKE ?", "%#{params[:q]}%"]
    else
      @initiatives          = Initiative.where(:status => :active)
      @retired_initiatives  = Initiative.where(:status => :completed)
    end
    respond_with @initiatives
  end

  def show
  	respond_with @initiative
  end

  def add_myself
    current_user.initiative = initiative
    render nothing: true, status: (current_user.save ? :ok : :bad_request)
  end

  def new
  	@initiative = Initiative.new
  	respond_with @initiative
  end

  def create
  	@initiative = Initiative.new(initiative_params)
  	if @initiative.save
  		flash[:notice] = "Initiative has been created."
  		return redirect_to initiative_path(@initiative)
  	end
  	flash[:alert] = "There was an error: #{@initiative.errors.full_messages.to_sentence}"
  	render :new
  end

  def edit
  	respond_with @initiative
  end

  def update
  	if @initiative.update_attributes(initiative_params)
  		flash[:notice] = "Initiative '#{@initiative.name}' has been updated."
  		return redirect_to initiative_path(@initiative)
  	end
  	flash[:alert] = "There was an error."
  	render :new
  end

  def destroy
  	if @initiative.destroy
  		flash[:notice] = "Initiative '#{@initiative.name}' has been successfully deleted."
  	end
  	redirect_to initiatives_path
  end

  private

    def initiative
    	@initiative ||= Initiative.find_by_id(params[:id])
    	unless @initiative
    		flash[:alert] = "Initiative not found."
    		redirect_to initiatives_path
    	end
      @users = @initiative.users
      @groups = @initiative.groups
      @initiative
    end
    helper_method :initiative


    def initiative_params
       params.require(:initiative).permit(:name, :description, :start_date, :tag_list, :status)
    end

    def send_activity_stream
      opts = initiative.activity actor: current_user.name_and_email_hash,
                                 action:  'initiative:join',
                                 message: 'AH IT WORKED'
      Yammer.post '/api/v1/activity', opts
    end

end