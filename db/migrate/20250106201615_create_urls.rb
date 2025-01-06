class CreateUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :urls do |t|
      t.string :uri
      t.belongs_to :login, null: false, foreign_key: true

      t.timestamps
    end
  end
end
