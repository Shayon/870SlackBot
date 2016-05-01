require 'sinatra'
require 'uri'

get '/' do
  puts 'hi'
  'get successful'
end

post '/music' do
  text = params[:text]
  puts '### text is: ' + text

  uris = extract_uris(text)
  youtubeUris = filter_for_youtube(uris)
  youtubeGuids = extract_guids(youtubeUris)
  print_guids(youtubeGuids)

end

def extract_uris(text)
  return URI.extract(text)
end

def filter_for_youtube(uris)
  youtubeUris = Array.new
  uris.each do |uri|
    puts '### uri argument is ' + uri
    if is_youtube_uri(uri)
      youtubeUris.push(uri)
    end
  end
  return youtubeUris
end

def extract_guids(youtubeUris)
  guidArray = Array.new

  youtubeUris.each do |uri|
    guid = uri[/https:\/\/www.youtube.com\/watch\?v=(.*)/, 1]
    guidArray.push guid
    puts '### guid is ' + guid
  end

  return guidArray
end

def is_youtube_uri(uri)
  uri.include? "youtube"
end

def print_guids(guidArray)
  puts '### All valid youtube uris:'
  puts ''
  guidArray.each do |guid|
    puts guid
  end
  puts ''
  puts '###'
end
