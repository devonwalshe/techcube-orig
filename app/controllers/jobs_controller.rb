class JobsController < ApplicationController
  
  def new
    @job = Job.new
    render "/admin/jobs/new/"
  end
  
  
  def create
    @job = Job.new(params[:job])
    
    if @job.save
      
      flash[:information] = "Job Added"
      redirect_to "/admin"
      
    else
      
      flash[:error] = @job.errors.full_messages.to_sentence
      redirect_to "/admin/jobs/new "
      
    end
    
    
  end
  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "Job Deleted"
    redirect_to :back
  end

  def edit
    @job = Job.find(params[:id])
    render "/admin/jobs/edit"
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:Job])
      flash[:success] = "Job updated."
      redirect_to "/admin"
    else
      render '/admin'
    end
  end

  def show
    
    @job = Job.where('id = ?', params[:id].split("-").first).first

    unless @job
      page_not_found
      return
    end
  end
  
end