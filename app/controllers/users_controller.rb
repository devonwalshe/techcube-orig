
class UsersController < ApplicationController

  before_filter :authenticate, :only => [:new, :edit, :update, :destroy]

  def new
    @user = User.new
    render "admin/users/new"
  end

  def create
     @user = User.new(params[:user])
     
     if @user.save
        unless current_user
          sign_in @user
        end
        flash[:notice] = "successfully created new user"
        redirect_to "/admin"
     else
        render :action => "new"
     end
     
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to :back
  end

  def edit
    @user = User.find(params[:id])
    render "/admin/users/edit"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User updated."
      redirect_to "/admin"
    else
      render '/admin'
    end
  end


end
