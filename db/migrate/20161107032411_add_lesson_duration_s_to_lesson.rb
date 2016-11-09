class AddLessonDurationSToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :lesson_duration_s, :integer
  end
end
