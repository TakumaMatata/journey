class HotelsController < ApplicationController

  require 'net/http'
  require 'json'

  def search
    uri = URI('https://app.rakuten.co.jp/services/api/Travel/VacantHotelSearch/20170426?applicationId=1089373237716979823&format=json&largeClassCode=japan&middleClassCode=akita&smallClassCode=tazawa&checkinDate=2018-10-15&checkoutDate=2018-10-16&adultNum=2')
    resp = Net::HTTP.get_response(uri)
    #http.use_ssl = true
    #req = Net::HTTP::Get.new(uri.path)
    #resp = http.request(req)
    result = JSON.parse(resp.body)
    @hotels = result["hotels"]


      # @hotel_id = @hotels.each do |h|
      #   h["hotel"][0]["hotelBasicInfo"]["hotelNum"]
      # end
  end

  def show
    id = params[:id]
    uri = URI('https://app.rakuten.co.jp/services/api/Travel/HotelDetailSearch/20170426?applicationId=1089373237716979823&format=json&hotelNo=' + id)
    resp = Net::HTTP.get_response(uri)
    result = JSON.parse(resp.body)
    @hotel_detail = result["hotels"][0]

    # uri = URI('https://app.rakuten.co.jp/services/api/Travel/VacantHotelSearch/20170426?applicationId=1089373237716979823&format=json&largeClassCode=japan&middleClassCode=akita&smallClassCode=tazawa&checkinDate=2018-10-15&checkoutDate=2018-10-16&adultNum=2')
    # resp = Net::HTTP.get_response(uri)
    # #http.use_ssl = true
    # #req = Net::HTTP::Get.new(uri.path)
    # #resp = http.request(req)
    # result = JSON.parse(resp.body)
    # @hotels = result["hotels"]["hotel"][0]["hotelBasicInfo"]

  end



  private
  # def hotel_params
  #   params.require(:hotels).permit(:)

  # end

end
