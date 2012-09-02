class EnquiriesController < ApplicationController
  def create
    @enquiry = Enquiry.new(params[:enquiry])
    
    if @enquiry.save
       flash[:information] = "Thanks for signing up! We will be in touch with more info"
       redirect_to "/tenants"
    else
      flash[:error] = @inquiry.errors.full_messages.to_sentence
      redirect_to "/tenants"
    end
    
  end
end
