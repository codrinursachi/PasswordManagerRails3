class CreateLogins < ActiveRecord::Migration[8.0]
  def change
    create_table :logins do |t|
      t.string :name
      t.string :login_name
      t.string :login_password
      t.text :notes
      t.boolean :is_favorite
      t.belongs_to :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
