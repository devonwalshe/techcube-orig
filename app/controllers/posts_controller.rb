
class PostsController < ApplicationController

before_filter :authenticate, :only => [:new, :edit, :update, :destroy]

def new
  @post = Post.new
  render "admin/posts/new"    
end

def create
  @post = Post.new(params[:post])
  if @post.save
    flash[:success] = "Post saved successfully"
    redirect_to "/admin"
  else
    flash[:error] = @post.errors.inspect
    redirect_to new_post_path
  end
  
end

def show
  @post = Post.find(params[:post].split("-").first)
  render "/posts/show"
end

def edit
  @post = Post.find(params[:id])
  render "admin/posts/edit"
end

def update
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    flash[:success] = "Page updated."
    redirect_to "/admin"
  else
    flash[:error] = "Error updating page"
    redirect_to "admin"
    
  end
  
end

def destroy
  Post.find(params[:id]).destroy
  flash[:success] = "Post Deleted"
  redirect_to :back
end

end
