class AddLessonDurationSToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_duration_m, :integer
  end
end
