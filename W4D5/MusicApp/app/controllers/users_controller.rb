class UsersController < ApplicationController

  def new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
  #show syntax??

#create should create new user, if successfully saved, redirect to account page.
#else show errors and redirect back to new user page
  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
      #update this music_url
    else
      # render :create
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
      #this is new URL, or should it be to create?
    end
  end

  private

  def user_params
    # debugger
    params.require(:user).permit(:email, :password)
  end

end
