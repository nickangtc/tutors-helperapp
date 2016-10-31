class LessonsController < ApplicationController
  def new
    puts "Landed on Lessons#new"
    @lesson = Lesson.new
    # values sent in with Ajax Get from calendar
    @lesson[:start_time] = params[:date]
    @current_user = current_user
    @selected_date = params[:date]
  end

  def create
    @lesson = Lesson.new(lesson_params)
    # set default values
    @lesson[:attended] = false
    @lesson[:paid] = false
    finish_time = (lesson_params[:start_time].to_f() + 7200).to_formatted_s
    @lesson[:end_time] = finish_time
    @lesson[:user_id] = current_user.id

    if @lesson.save
      flash[:success] = "Lesson saved."
  		redirect_to lessons_path(@lesson)
  	else
      flash[:error] = "Something went wrong. Please try again."
  		render :new
  	end
  end

  private

  def lesson_params
    params.require(:post).permit(:start_time)
  end
end
