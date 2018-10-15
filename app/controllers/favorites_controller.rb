class FavoritesController < ApplicationController
  def index
    @favorites = Favorites.all
  end

  def show
    @favorite = Favorites.find(params[:user_id])
  end

  def create
    @user_id = params[:user_id]
    @hotel_id = params[:hotel_id]
    if Favorite.create(hotel_id: @hotel_id, user_id: @user_id)
      redirect_to request.referrer, notice: 'hotel has been favorited'
    else
      redirect_to hotels_path, alert: 'Something went wrong'
    end
  end

  # def destroy
  #   @user_id = params[:user_id]
  #   @hotel_id = params[:hotel_id]
  #   #Favorite.where(hotel_id: @hotel_id, user_id: @user_id).first.destroy
  #   Favorite.where("user_id = ? AND hotel_id = ?", @user_id, @hotel_id).first.destroy
  #   redirect_to request.referrer, notice: 'hotel is no longer in favorites'
  # end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id] || params[:user_id])
  end
end
