require 'sinatra'
require 'json'
require 'uri'

$foo = 'hello'

get '/' do
  '#{$foo}'
end

post '/music/' do
	puts 'success'
	#text = params[:text]
	#if text =~ /\A#{URI::regexp}\z/ && valid_websites(text)
	#	puts "okay"
	#end
end

def valid_websites(url)
	return url.include? "youtube"
end