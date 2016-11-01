class AddStudentHasReadNoteToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :student_has_read_note, :boolean
  end
end
