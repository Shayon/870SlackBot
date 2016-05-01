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

  guidArray = Array.new

  links = URI.extract(text)
  links.each do |link|
    puts '### link argument is ' + link
    if link =~ /\A#{URI::regexp}\z/ && valid_websites(link)
      guid = link[/https:\/\/www.youtube.com\/watch\?v=(.*)/, 1]
      guidArray.push guid
      puts '### guid is ' + guid
    end
  end

  print_guids(guidArray)

end

def print_guids(guidArray)
  puts '### All valid youtube links:'
  puts ''
  guidArray.each do |guid|
    puts guid
  end
  puts ''
  puts '###'
end

def valid_websites(url)
	return url.include? "youtube"
end