require 'net/http'

class LocuController < ApplicationController
  def index
    
    uri = URI('http://api.locu.com/v1_0/venue/search/')
    locu_params = { :locality => params[:city],
               :category => "Restaurant", 
               :cuisine => params[:cuisine], 
               :limit => '10',
               :api_key=> 'ee5bcc6e70b68f567a0d3066b583ebb909a199bb' }
    uri.query = URI.encode_www_form(locu_params)

    @res = Net::HTTP.get_response(uri)
    
    respond_to do |format|
      format.json { render :json => @res.body }
    end
    
  end
  
end
