class LessonsController < ApplicationController
  def new
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
    @lesson[:user_id] = current_user.id
    # # uncomment if adding end_time attribute to lessons
    # finish_time = (lesson_params[:start_time].to_f() + 7200).to_formatted_s
    # @lesson[:end_time] = finish_time

    if @lesson.save
      flash[:success] = "Lesson booked with TEACHER_NAME. " + random_quote
  		redirect_to '/users/' + current_user.id.to_s
  	else
      flash[:error] = "Something went wrong. Please try again."
  		render :new
  	end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:start_time)
  end

  def random_quote
    quotes = [
      "Study smart!",
      "Keep up the passion!",
      "Keep doing what you do.",
      "Any fool can know. The point is to understand. (Albert Einstein)"
    ]
    rn = Random.new
    quotes[rn.rand(0..quotes.length)]
  end
end
