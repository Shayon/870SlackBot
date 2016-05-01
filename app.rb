require 'sinatra'
require 'json'
require 'uri'

$foo = 'hello'

get '/' do
  puts 'hi'
  '#{$foo}'
end

post '/music' do
  text = params[:text]
  puts "### text is: " + text
  links = URI.extract(text)
  links.each do |link|
    puts '### link arguement is ' + link
    if link =~ /\A#{URI::regexp}\z/ && valid_websites(link)
      guid = link[/https:\/\/www.youtube.com\/watch\?v=(.*)/, 1]
      puts '### guid is ' + guid
      puts '### uri thing works'
    else
      puts '### uri thing does not work'
    end
    if valid_websites(link)
      puts '### arguement contains youtube'
    else
      puts '### arguement is invalid'
    end
  end
end

def valid_websites(url)
	return url.include? "youtube"
end