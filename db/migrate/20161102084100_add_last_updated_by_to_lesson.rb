class AddLastUpdatedByToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :last_updated_by, :integer
  end
end
