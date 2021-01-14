class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_parameter)
    redirect_to root_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end

end
