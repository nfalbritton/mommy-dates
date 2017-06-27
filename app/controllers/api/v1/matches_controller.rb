class Api::V1::MatchesController < ApplicationController

  def index
    if params[:event_id].blank?
      @heading = "'Mommy' is just another word for 'awesome-sauce'"
      render json: User.all
    else
      @event = Event.find(params[:event_id])
      @users = User.where(event_id: event.id)
      @heading = "Mommies in your area: "
      render json: Match.all
    end
  end
end
