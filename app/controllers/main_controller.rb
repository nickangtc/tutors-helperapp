class MainController < ApplicationController
  def index
    @user = current_user
    if @user != nil && !@user.admin
      @lessons_past = @user.lessons
                          .where.not( start_time: 10.years.ago..Time.now )
                          .order("start_time DESC")
                          .limit(10)

      @lessons_upcoming = @user.lessons
                              .where.not( start_time: 10.years.ago..Time.now )
                              .order("start_time ASC")

    elsif @user != nil && @user.admin
      @lessons_past = Lesson.where.not( start_time: 10.years.ago..Time.now )
                            .order("start_time DESC")
                            .limit(10)

      @lessons_upcoming = Lesson.where.not( start_time: 10.years.ago..Time.now )
                                .order("start_time ASC")
                                .limit(10)

      # Only teacher gets notified of changes to lesson details
      @notifications = Lesson.where.not( last_updated_by: @user.id )
                              .where( has_seen_notification: false, label: "lesson" )
                              .order("updated_at DESC")
    end
  end
end
