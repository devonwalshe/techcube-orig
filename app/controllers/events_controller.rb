class EventsController < ApplicationController
  
  def create
    @event = Event.new(params[:event])
    
    if @event.save
      
      flash[:information] = "Event Added"
      redirect_to "/events"
      
    else
      
      flash[:error] = @event.errors.full_messages.to_sentence
      redirect_to "/events"
      
    end
    
    
  end
  
  
  def update
    
  end
  
end