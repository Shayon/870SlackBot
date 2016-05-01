require 'sinatra'
require 'uri'

$foo = 'hello'

get '/' do
  puts 'hi'
  'get successful'
end

post '/music' do
  text = params[:text]
  puts '### text is: ' + text
  links = URI.extract(text)
  links.each do |link|
    puts '### link argument is ' + link
    if link =~ /\A#{URI::regexp}\z/ && valid_websites(link)
      guid = link[/https:\/\/www.youtube.com\/watch\?v=(.*)/, 1]
      puts '### guid is ' + guid
    end
  end
end

def valid_websites(url)
	return url.include? "youtube"
end