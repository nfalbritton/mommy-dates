class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]= "User added successfully"
      redirect_to @user
    else
      flash[:notice]= @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user?
      @user.destroy
      redirect_to '/user'
    end
  end


  private

  def set_user
    @user = USER.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
    :username,
    :first_name,
    :last_name,
    :email,
    :zipcode,
    :phone,
    :avatar_url,
    :about_me
    )
  end
end