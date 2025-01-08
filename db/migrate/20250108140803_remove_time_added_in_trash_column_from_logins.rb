class RemoveTimeAddedInTrashColumnFromLogins < ActiveRecord::Migration[8.0]
  def change
    remove_column :logins, :time_added_in_trash, :datetime
  end
end
