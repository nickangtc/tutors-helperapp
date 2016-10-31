class RenameStudentUidInLesson < ActiveRecord::Migration[5.0]
  def change
    rename_column :lessons, :student_uid, :user_id
  end
end
