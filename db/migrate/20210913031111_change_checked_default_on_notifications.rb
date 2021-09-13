class ChangeCheckedDefaultOnNotifications < ActiveRecord::Migration[5.2]
  def up
    # change_column :notifications, :checked,:boolean, default: 0
    change_column_default :notifications, :checked, false
  end

  def down
    # change_column :notifications, :checked,:boolean
    change_column_default :notifications, :checked, nil
  end
end
