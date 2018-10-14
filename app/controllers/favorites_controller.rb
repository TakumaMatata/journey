class FavoritesController < ApplicationController
  def index
    @favorties = Favorites.all
  end

  def create
    if Favorite.create(favorited: @hotel, user: current_user)
      redirect_to @hotel, notice: 'hotel has been favorited'
    else
      redirect_to @hotel, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @hotel.id, user_id: current_user.id).first.destroy
    redirect_to @hotel, notice: 'hotel is no longer in favorites'
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id] || params[:id])
  end
end
