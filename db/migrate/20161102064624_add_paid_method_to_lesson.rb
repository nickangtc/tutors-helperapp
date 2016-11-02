class AddPaidMethodToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :paid_method, :integer
  end
end
