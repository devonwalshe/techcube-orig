class PagesController < ApplicationController

before_filter :authenticate, :only => [:new, :edit, :update, :destroy]

def new
  @page = Page.new
  render "admin/pages/new"
end

def create
  @page = Page.new(params[:page])
  
  if @page.save
    flash.now[:success] = "Page created successfully"
    redirect_to "/admin"
  else
    render :action => "new"
  end
end

def destroy
  Page.find(params[:id]).destroy
  flash[:success] = "Page Deleted"
  redirect_to :back
end

def edit
  @page = Page.find(params[:id])
  render "/admin/pages/edit"
end

def update
  @page = Page.find(params[:id])
  if @page.update_attributes(params[:page])
    flash[:success] = "Page updated."
    redirect_to "/admin"
  else
    render '/admin'
  end
end

def news
  @posts = Post.order("created_at DESC")
  render "/pages/news"
end

def show
  @page = Page.where('url = ?', params[:url]).first
  
  unless @page
    page_not_found
    return
  end
end


end
