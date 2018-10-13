class HotelsController < ApplicationController

  require 'net/http'
  require 'json'

  def search

    if params.has_key?(:num_of_ppl)

      location = params[:location]
      area = Geocoder.search(location)
      area.first.coordinates

      latitude_raw = area.first.coordinates[0]
      longitude_raw = area.first.coordinates[1]

      latitude = (latitude_raw * 3600).round(2)
      longitude = (longitude_raw * 3600).round(2)

      num_of_ppl = params[:num_of_ppl]
      check_in_date = params[:check_in]
      check_out_date = params[:check_out]

      uri = URI('https://app.rakuten.co.jp/services/api/Travel/VacantHotelSearch/20170426')
      data = {
        :applicationId => '1089373237716979823',
        :format => 'json',
        :latitude => latitude,
        :longitude => longitude,
        :searchRadius => '1',
        :checkinDate => check_in_date,
        :checkoutDate => check_out_date,
        :adultNum => num_of_ppl
      }


      uri.query = URI.encode_www_form(data)

      resp = Net::HTTP.get_response(uri)
      #http.use_ssl = true
      #req = Net::HTTP::Get.new(uri.path)
      #resp = http.request(req)
      result = JSON.parse(resp.body)
puts result
      @hotels = result["hotels"]

    else
      num_of_ppl = 1
      check_in_date = '2018-10-15'
      check_out_date = '2018-10-18'
      @hotels = []
    end
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
  def hotel_params
    params.require(:hotel).permit(:location, :num_of_ppl, :check_in, :check_out)
  end
end
