class WelcomeController < ApplicationController

  def index
  end

  def test
    @response = HTTParty.get("http://api.wikimapia.org/?key=#{ENV['wikimapia_api_key']}&function=category.getall&name=Checkpoint&format=json") 
    end
end
