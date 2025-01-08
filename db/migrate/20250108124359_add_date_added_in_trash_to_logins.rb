class AddDateAddedInTrashToLogins < ActiveRecord::Migration[8.0]
  def change
    add_column :logins, :date_added_in_trash, :date
  end
end
