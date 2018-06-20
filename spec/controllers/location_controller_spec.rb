require 'rails_helper'

RSpec.describe V1::LocationController, type: :controller do

  describe "GET #index" do
    it "returns 401" do
      get :index
      expect(response).to have_http_status(401)
    end
  end

  describe "GET #index" do
    it "returns 400 (empty query parameter)" do
    	# helper.request.env['HTTP_USER_AGENT'] = ["authorization_key"]
    	request.env["HTTP_AUTHORIZATION"] = "testing123"
      get :index
      expect(response).to have_http_status(400)
    end
  end

  describe "GET #index" do
    it "returns 400 (Invalid query parameter: location not exists)" do
    	# helper.request.env['HTTP_USER_AGENT'] = ["authorization_key"]
    	query = "tttttttttttttt"
    	request.env["HTTP_AUTHORIZATION"] = "testing123"
      get :index, {:params => {:query => query}}
      expect(response).to have_http_status(400)
    end
  end

  describe "GET #index" do
    it "returns 200" do
    	# helper.request.env['HTTP_USER_AGENT'] = ["authorization_key"]
    	query = "Paris"
    	request.env["HTTP_AUTHORIZATION"] = "testing123"
      get :index, {:params => {:query => query}}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #index" do
    it "returns 200 and results not empty" do
    	# helper.request.env['HTTP_USER_AGENT'] = ["authorization_key"]
    	query = "Paris"
    	request.env["HTTP_AUTHORIZATION"] = "testing123"
      get :index, {:params => {:query => query}}

      result = JSON.parse(response.body)
      result[:location] != ""
    end
  end

end
