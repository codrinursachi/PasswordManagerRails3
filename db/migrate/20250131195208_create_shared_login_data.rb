class CreateSharedLoginData < ActiveRecord::Migration[8.0]
  def change
    create_table :shared_login_data do |t|
      t.belongs_to :login, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
