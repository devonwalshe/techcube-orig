
class TenantsController < ApplicationController

  before_filter :authenticate, :only => [:new, :edit, :update, :destroy]
  
  def index
    @tenants = Tenant.order("name ASC").all
    render "pages/tenants"
  end

  def new
    @tenant = Tenant.new
    render "admin/tenants/new"
  end

  def create
     @tenant = Tenant.new(params[:tenant])
     
     if @tenant.save
        flash[:success] = "successfully created new tenant"
        redirect_to "/admin"
     else
        render :action => "new"
     end
     
  end

  def destroy
    Tenant.find(params[:id]).destroy
    flash[:success] = "Tenant Deleted"
    redirect_to :back
  end

  def edit
    @tenant = Tenant.find(params[:id])
    render "/admin/tenants/edit"
  end

  def update
    @tenant = Tenant.find(params[:id])
    if @tenant.update_attributes(params[:tenant])
      flash[:success] = "Tenant updated."
      redirect_to "/admin"
    else
      render '/admin/tenants/edit'
    end
  end


end
