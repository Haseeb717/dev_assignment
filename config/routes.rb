Rails.application.routes.draw do
  namespace :v1 do
  	scope "location" do
  		get 'index' => "location#index"
  	end
  end
end
