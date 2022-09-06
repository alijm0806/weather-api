class WeathersController < ApplicationController
  def index
    city = params[:city]
    unit = params[:unit]

    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{Rails.application.credentials.weathers_api_key}&units=metric")
    weathers = response.parse(:json)
    render json: weathers.as_json
  end
end

# For temperature in Fahrenheit use units=imperial
# For temperature in Celsius use units=metric
# Temperature in Kelvin is used by default, no need to use units parameter in API call

# front end send axios requests for index
