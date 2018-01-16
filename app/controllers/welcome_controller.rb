class WelcomeController < ApplicationController

  def index
  end

  def test
    @response = HTTParty.get("http://api.wikimapia.org/?key=#{ENV['wikimapia_api_key']}&function=category.getall&name=Checkpoint&format=json") 
    end

  def search
    base_url = "http://api.wikimapia.org/"

    request_params = {:format => "json", :key => ENV["wikimapia_api_key"], :function => "place.search" }
  
    request_params.merge!(search_params)
    @response = HTTParty.get base_url, query: request_params 
  end  

  def search_params
  	params.permit([:q, :lat, :lon, :distance])
  end 
end
