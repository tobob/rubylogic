class AddUnreadIntoNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :unread, :boolean, default: 1
  end
end
