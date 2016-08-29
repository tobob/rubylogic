class AddCostAndImplementationIntoNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :cost, :integer
    add_column :notifications, :implementation, :datetime
  end
end
