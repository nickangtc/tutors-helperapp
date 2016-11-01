class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :update, :destroy]

  def new
    @lesson = Lesson.new
    # values sent in with Ajax Get from calendar
    @lesson[:start_time] = params[:date]
    @user = current_user
    @selected_date = params[:date]

    # For dropdown selection if user is admin
    # to select which student to create lesson for
    if current_user.admin
      @users = User.all
    end
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
      if current_user.admin
        flash[:success] = "Lesson created. Your student will be notified. Happy teaching!"
      elsif !current_user.admin
        tutor_name = User.find_by( admin: true ).name
        flash[:success] = "Lesson booked with #{tutor_name}. " + random_quote
      end
      redirect_to '/users/' + current_user.id.to_s
  	else
      flash[:error] = "Something went wrong. Please try again."
  		render :new
  	end
  end

  def show
  end

  def update
    if @lesson.update(lesson_params)
      flash[:success] = "Lesson details amended."
      redirect_to '/users/' + current_user.id.to_s
    else
      flash[:error] = "Something went wrong. Please try again."
      render root_path
    end
  end

  def destroy
    @lesson.destroy
    flash[:success] = "Lesson cancelled. Don't give up on learning!"
    redirect_to '/users/' + current_user.id.to_s
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  # For tutor's access only
  # View all classes that have passed
  def index
    # (10 years is a suitably long time to not matter chasing debts...)
    @completed_lessons = Lesson.where( start_time: 10.years.ago..Time.now ).order("start_time DESC")
  end

  private

  def lesson_params
    params.require(:lesson).permit(:start_time, :user_id)
  end

  def find_lesson
    @lesson = Lesson.find(params[:id])
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
