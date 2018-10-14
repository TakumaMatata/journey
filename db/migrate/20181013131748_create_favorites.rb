class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, id: false do |t|
      t.string :favorite_hotels
      t.timestamps
    end
  end
end
