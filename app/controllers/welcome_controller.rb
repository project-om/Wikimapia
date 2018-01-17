class WelcomeController < ApplicationController

  def index
     
       #@response = HTTParty.get("http://api.wikimapia.org/?key=#{ENV['wikimapia_api_key']}&function=place.getnearest&lat=35.95451&lon=39.00934&format=json")
      base_url = "http://api.wikimapia.org/"

      request_params = {:format => "json", :key => ENV["wikimapia_api_key"], :function => "place.getnearest" }
  
      request_params.merge!(search_params)
      @response = HTTParty.get base_url, query: request_params 

      @results = {}
      @results[:query] = response['name']
      @results[:distance] = response['meters']
  end

  #def test
    #@response = HTTParty.get("http://api.wikimapia.org/?key=#{ENV['wikimapia_api_key']}&function=place.getnearest&lat=35.95451&lon=39.00934&format=json") 
  #end

  #def search
    #base_url = "http://api.wikimapia.org/"

    #request_params = {:format => "json", :key => ENV["wikimapia_api_key"], :function => "place.getnearest" }
  
    #request_params.merge!(search_params)
    #@response = HTTParty.get base_url, query: request_params 
  #end  

  def search_params
  	params.permit([:q, :lat, :lon, :distance])
  end 
end
