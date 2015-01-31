json.models @songs do |song|
  json.partial! "api/songs/list_show", song: song
end

json.page_number @page
json.total_pages @songs.total_pages
