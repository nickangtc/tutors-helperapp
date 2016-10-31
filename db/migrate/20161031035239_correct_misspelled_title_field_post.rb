class CorrectMisspelledTitleFieldPost < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :tite, :title
  end
end
