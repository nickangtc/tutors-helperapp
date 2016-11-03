class UsersController < ApplicationController
  def show
    @user = current_user

    if @user.admin
      @lessons = Lesson.all

      # Only teacher gets notified of changes to lesson details
      @notifications = Lesson.where.not( last_updated_by: @user.id )
                              .where( has_seen_notification: false, label: "lesson" )
                              .order("updated_at DESC")

    elsif !@user.admin
      # @user = User.find(params[:id])
      @tutor_name = User.find_by( admin: true ).name
      @lessons = Lesson.all
      @lesson = Lesson.new
    end
  end

end
