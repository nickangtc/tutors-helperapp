class RenameLessonDurationInSToLessonDurationInM < ActiveRecord::Migration[5.0]
  def change
    rename_column :lessons, :lesson_duration_m, :lesson_duration_m
  end
end
