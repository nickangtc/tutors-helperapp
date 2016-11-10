# NOTE:
#   - Lesson table currently stores a lot of info
#   some might say it's bad db design. I agree.
#   - TODO: Split up Lesson table to at least 2 other tables.
#   - label attribute has 2 types: "lesson" and "unavailable"

class LessonsController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_lesson, only: [:show, :update, :destroy, :edit, :mark_note_as_read]
  before_action :find_lesson, except: [:new, :create, :index]

  after_action :add_notification, only: [:update]
  after_action :increment_updated_count, only: [:update]

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
    @lessons_that_day = Lesson.where( start_time: lesson_params[:start_time].to_date )

    # Check if datetime selected by user does not clash with existing records
    if is_unique(@lesson, @lessons_that_day)
      # Set defaults
      @lesson[:updated_count] = 0
      @lesson[:student_has_read_note] = false

      if !current_user.admin
        @lesson[:user_id] = current_user.id
        # 2 hour default hardcoded
        @lesson[:lesson_duration_m] = 2 * 60
      end

      # Define event type and Set default values
      if @lesson[:label] == "unavailable"
        @lesson[:attended] = nil
        @lesson[:paid] = nil
      else
        @lesson[:paid] = false
        @lesson[:label] = "lesson"
      end

      if @lesson.save
        if current_user.admin
          if @lesson[:label] == "unavailable"
            flash[:success] = "#{@lesson[:start_time].to_date.to_formatted_s(:short)} has been blocked - Students can no longer book for that day."
          else
            flash[:success] = "Lesson on #{@lesson[:start_time].to_date.to_formatted_s(:short)} saved. Happy teaching!"
          end
        elsif !current_user.admin
          tutor_name = User.find_by( admin: true ).name
          flash[:success] = "Lesson booked with #{tutor_name}. #{random_quote()}"
        end
        add_notification
        redirect_back(fallback_location: user_path(current_user))
    	else
        flash[:error] = "Something went wrong. Please try again."
    		render :new
    	end

    elsif !is_unique(@lesson, @lessons_that_day)
      # Datetime chosen by user conflicts with an existing record
      flash[:error] = "Lesson time clashes with an existing event. Try again!"
      redirect_back(fallback_location: user_path(current_user))
    end
  end

  def update
    # Sanitise default paid_method value if teacher selected paid=false
    if lesson_params[:paid] == 'false'
      @sanitised_params = lesson_params
      @sanitised_params[:paid_method] = nil
    else
      @sanitised_params = lesson_params
    end


    if @lesson.update(@sanitised_params)
      flash[:success] = "Lesson details for #{@sanitised_params[:start_time].to_date.to_formatted_s(:short)} amended."
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Something went wrong. Please try again."
      render root_path
    end
  end

  def destroy
    @lesson.destroy
    if current_user.admin
      flash[:success] = "Schedule for #{@lesson[:start_time].to_date.to_formatted_s(:short)} updated."
    elsif !current_user.admin
      flash[:success] = "Lesson cancelled. Don't give up on learning!"
    end
    redirect_back(fallback_location: user_path(current_user))
  end

  # For tutor's access only
  # View all classes that have passed
  def index
    if current_user.admin
      # (10 years is a suitably long time to not matter chasing debts...)
      @lessons_to_debrief = Lesson.where(
                              start_time: 10.years.ago..Time.now,
                              attended: nil )
                            .order("start_time DESC")
      @lessons_not_paid = Lesson.where( start_time: 10.years.ago..Time.now )
                            .where.not( attended: nil )
                            .where( paid: false )
                            .order("start_time DESC")
      @lessons_completed = Lesson.where(
                              start_time: 1.month.ago..Time.now,
                              attended: true,
                              paid: true)
                            .order("start_time DESC")
    else
      @lessons = current_user.lessons.where.not( student_notes: nil )
                .where( student_has_read_note: false )
    end
  end

  def edit
  end

  def mark_note_as_read
    @lesson.update(student_has_read_note: true)
    flash[:success] = "Note marked as read."
    redirect_back(fallback_location: root_path)
  end

  def dismiss_notification
    @lesson.update( has_seen_notification: true )
    redirect_back(fallback_location: root_path)
  end

  private

  def lesson_params
    params.require(:lesson)
      .permit(:start_time, :user_id, :attended, :student_notes, :private_notes, :paid, :label, :paid_method, :lesson_duration_m)
  end

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def add_notification
    @lesson.update(last_updated_by: current_user.id,
                    has_seen_notification: false)
  end

  def increment_updated_count
    updated_count = @lesson[:updated_count] + 1
    @lesson.update( updated_count: updated_count )
  end

  def is_unique (new_lesson, existing_lessons)
    existing_lessons.each do |lesson|
      lesson_start_time = lesson[:start_time].to_time
      lesson_end_time = lesson_start_time + lesson[:lesson_duration_m].minutes
      if ( lesson_start_time..lesson_end_time ).cover?( new_lesson[:start_time].to_time )
        return false
      else
        return true
      end
    end
  end

  def random_quote
    quotes = [
      'Study smart!',
      'Keep up the passion!',
      'Keep doing what you do.',
      '"The point is to understand."'
    ]
    rn = Random.new
    quotes[rn.rand(0..quotes.length)]
  end
end
