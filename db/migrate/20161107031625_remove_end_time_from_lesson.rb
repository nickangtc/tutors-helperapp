class RemoveEndTimeFromLesson < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :end_time
  end
end
