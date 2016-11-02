class AddUpdatedCountToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :updated_count, :integer
  end
end
