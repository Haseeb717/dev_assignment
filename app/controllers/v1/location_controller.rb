class V1::LocationController < ApplicationController
	before_action :verify_request

  def index
  	query = params["query"]
    if query.present?

    	begin
    		results = Geocoder.coordinates(query) # get coordinates of location
    		results = results.join(" , ") if results.present? 
    	rescue Exception => e
    		error = e.message # Exception handling if api not working etc
    	end

    	if results.present?
    		render json: {:location=>results}, :status=>200
    	elsif error.present?
    		render json: {:error=>error}, :status=>500
    	else
    		render json: {:message=>"Required Parameters Invalid"}, :status=>400 # if location is not valid
    	end
    else
      render json: {:message=>"Required Parameters Empty"}, :status=>400 # Require Paramters are empty
    end
  		
  end

  private
    # verify api token in header
  	def verify_request
			unless request.headers['Authorization'].present? && request.headers['Authorization'] == APIKEYS["authorization_key"]
	      render json: {:message=>"UnAuthorize Request"}, :status=>401
	   	end
	  end
end
