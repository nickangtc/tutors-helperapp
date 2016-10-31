class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lessons = @user.lessons
  end

end
