class AddFileToLogins < ActiveRecord::Migration[8.0]
  def change
    add_column :logins, :file, :string
  end
end
