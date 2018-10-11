class RakutenHotelsController < ApplicationController

  def search
    @hotels = https://app.rakuten.co.jp/services/api/Travel/VacantHotelSearch/20170426?applicationId=1089373237716979823&format=json&largeClassCode=japan&middleClassCode=akita&smallClassCode=tazawa&checkinDate=2018-10-12&checkoutDate=2018-10-14&adultNum=2
  end
end
