require 'sinatra'
require 'json'
require 'uri'

$foo = 'hello'

get '/' do
  puts 'hi'
  '#{$foo}'
end

post '/music/:isValid/' do
	puts 'successfully hit post'
  if params[:isValid] == 'true'
    link = 'https://www.youtube.com/watch?v=P-gGZ2rJqfQ'
  else
    link = 'youtube'
  end
  puts 'link arguement is ' + link
	if link =~ /\A#{URI::regexp}\z/ && valid_websites(link)
    gid = link[/https:\/\/www.youtube.com\/watch\?v=(.*)/, 1]
    puts 'gid is ' + gid
    puts 'uri thing works'
  else
    puts 'uri thing does not work'
  end
  if valid_websites(link)
		puts 'arguement contains youtube'
  else
    puts 'arguement is invalid'
  end
end

def valid_websites(url)
	return url.include? "youtube"
end