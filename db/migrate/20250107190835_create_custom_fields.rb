class CreateCustomFields < ActiveRecord::Migration[8.0]
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.string :value
      t.belongs_to :login, null: false, foreign_key: true

      t.timestamps
    end
  end
end
