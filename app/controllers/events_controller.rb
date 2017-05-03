class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = @user

      if @event.save
        redirect to @events, flash[:notice] = "Event successfully created!"
      else
        redirect_to @events
        render :new
      end
    end

  def edit
    @event = Event.find(params[:id])
    @user = current_user

    if @user.id == @event.user_id
      render :edit_event_path
    else
      flash[:notice] = "You don't have permission to edit this event"
      redirect_to @events
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @user = current_user

    if @user.id == @event.id
      @event.destroy
      redirect_to @events, flash[:notice] = "You have deleted this event!"
    else
      flash[:notice] = "You don't have permission to delete this event"
      redirect_to @event
    end
end

  private

  def event_params
    params.require(:event).permit(:name, :location, :zipcode, :description, :night_out, :outdoor_activity, :workout_buddy, :play_date)
  end

end
