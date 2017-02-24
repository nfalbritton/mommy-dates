class SearchesController < ApplicationController

  def index
    if Event.search(params[:term])
      @events = Event.search(params[:term])
    else
      @events = nil
    end
    @event - Event.new
  end

end
