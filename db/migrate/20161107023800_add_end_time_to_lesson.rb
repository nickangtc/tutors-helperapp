class AddEndTimeToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :end_time, :datetime
  end
end
