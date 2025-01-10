class RenameTrashDateColumnFromLogins < ActiveRecord::Migration[8.0]
  def change
    rename_column :logins, :date_added_in_trash, :trash_date
  end
end
