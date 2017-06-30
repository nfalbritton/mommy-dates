class UsersController < ApplicationController

  def index
    @message = "Hello Users!"
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    if @user.save
      flash[:notice]= "User added successfully"
      redirect_to @user
    else
      flash.now[:error] = @user.errors
      setup_form_values
      respond_to do |format|
      format.html { render :action => :edit }
    end
  end


  def destroy
    @user = User.find(params[:id])
    if current_user?
      @user.destroy
      redirect_to '/user'
    end
  end

  def user_interest?(event)
    @user.event.include?
  end
end


  private

  def set_user
    @user = USER.find(params[:id])
  end
end
