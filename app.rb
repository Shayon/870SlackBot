require 'sinatra'
require 'uri'

get '/' do
  puts 'hi'
  'get successful'
end

post '/music' do
  text = params[:text]
  puts '### text is: ' + text

  guidArray = extract_youtube_guids(text)
  print_guids(guidArray)

end

def extract_youtube_guids(text)
  guidArray = Array.new

  links = URI.extract(text)
  links.each do |link|
    puts '### link argument is ' + link
    if is_youtube_uri(link)
      guid = link[/https:\/\/www.youtube.com\/watch\?v=(.*)/, 1]
      guidArray.push guid
      puts '### guid is ' + guid
    end
  end

  return guidArray
end

def is_youtube_uri(link)
  return link =~ /\A#{URI::regexp}\z/ && valid_website(link)
end

def valid_website(url)
  return url.include? "youtube"
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
