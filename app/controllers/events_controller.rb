class EventsController < ApplicationController
  
  def index
    @otc_events = get_otc_events["data"]
    
    render "pages/events"
  end
  
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
  
  private
  
  def get_otc_events
    uri = URI.parse("http://opentechcalendar.co.uk/index.php/location/1/json")
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    events = JSON.parse(response.body)
  end
end