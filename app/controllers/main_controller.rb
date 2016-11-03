class MainController < ApplicationController
  def index
    @user = current_user
    @lessons_past = @user.lessons
                        .where.not( start_time: 10.years.ago..Time.now )
                        .order("start_time DESC")

    @lessons_upcoming = @user.lessons
                            .where.not( start_time: 10.years.ago..Time.now )
                            .order("start_time DESC")
  end
end
