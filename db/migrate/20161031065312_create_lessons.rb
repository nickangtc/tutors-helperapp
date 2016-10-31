class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :student_uid
      t.datetime :start_time
      t.boolean :attended
      t.boolean :paid
      t.text :student_notes
      t.text :private_notes

      t.timestamps
    end
  end
end
