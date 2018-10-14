class AddHotelIdTofavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :hotel_id, :bigint
  end
end
