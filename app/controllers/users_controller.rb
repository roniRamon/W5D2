class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def update
  end

  def edit
  end

  def index
  end

  def show
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
