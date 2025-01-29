class AddFavIconToUrls < ActiveRecord::Migration[8.0]
  def change
    add_column :urls, :fav_icon, :string
  end
end
