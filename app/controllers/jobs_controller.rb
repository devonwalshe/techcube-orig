class JobsController < ApplicationController
  
  def create
    @job = Job.new(params[:job])
    
    if @job.save
      
      flash[:information] = "Job Added"
      redirect_to "/jobs"
      
    else
      
      flash[:error] = @job.errors.full_messages.to_sentence
      redirect_to "/jobs"
      
    end
    
    
  end
  
  
  def update
    
  end
  
end