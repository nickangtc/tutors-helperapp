class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lessons = @user.lessons
    @lesson = Lesson.new
  end

end
