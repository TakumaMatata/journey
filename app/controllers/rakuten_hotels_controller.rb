class RakutenHotelsController < ApplicationController

  require 'net/http'
  require 'json'

  def search
    uri = URI('https://app.rakuten.co.jp/services/api/Travel/VacantHotelSearch/20170426?applicationId=1089373237716979823&format=json&largeClassCode=japan&middleClassCode=akita&smallClassCode=tazawa&checkinDate=2018-10-12&checkoutDate=2018-10-14&adultNum=2')
    resp = Net::HTTP.get_response(uri)
    #http.use_ssl = true
    #req = Net::HTTP::Get.new(uri.path)
    #resp = http.request(req)
    result = JSON.parse(resp.body)
    @hotels = result["hotels"]
  end



  private
  def hotel_params

  end
end
