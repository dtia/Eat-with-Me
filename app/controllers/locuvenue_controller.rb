require 'net/http'

class LocuvenueController < ApplicationController
  def show
    
    uri = URI('http://api.locu.com/v1_0/venue/' + params[:id] + "/")
    locu_params = { :api_key=> 'ee5bcc6e70b68f567a0d3066b583ebb909a199bb' }
    uri.query = URI.encode_www_form(locu_params)
    
    puts uri
    @res = Net::HTTP.get_response(uri)
     
    respond_to do |format|
      format.json { render :json => @res.body }
    end
    
  end
  
end
