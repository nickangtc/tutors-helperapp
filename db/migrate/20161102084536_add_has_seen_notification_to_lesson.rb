class AddHasSeenNotificationToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :has_seen_notification, :boolean
  end
end
