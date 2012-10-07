require 'bundler'
require 'net/http'
Bundler.require

class App < Sinatra::Base
	register Sinatra::CrossOrigin

	# CSS running through SCSS
	get '/css/*.css' do
		content_type 'text/css', :charset => 'utf-8'
		scss params[:splat].join.to_sym, :style => :compressed
	end

	get '/' do
		cross_origin
    	callback = params['callback']
    	json = ["#{params[:term]}lol", "#{params[:term]}trlol", "#{params[:term]}asdf"].to_json

    	content_type(callback ? :js : :json)
    	response = callback ? "#{callback}(#{json})" : json

	    response
	end
end