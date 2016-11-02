class AddLabelToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :label, :string, :default => "lesson"
  end
end
