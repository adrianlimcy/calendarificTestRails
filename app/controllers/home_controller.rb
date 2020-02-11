class HomeController < ApplicationController
  def index

    apiKey = Rails.application.credentials.calendarific[:api_key]

    year = Time.current.year.to_s

    url = 'https://calendarific.com/api/v2/holidays?&api_key='+ apiKey + '&country=SG&year='+ year

    request = HTTParty.get(url).to_json
    @request_hash = JSON.parse(request)

    @holidays = @request_hash["response"]["holidays"]

    @national_holidays = []

    @holidays.each do |hol|
      @national_holidays << hol if hol["type"] == 	["National holiday"]
    end
  end
end
