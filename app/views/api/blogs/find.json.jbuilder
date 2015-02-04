json.models @blogs do |blog|
  json.partial! "api/blogs/list_show", blog: blog
end

json.page_number @page
json.total_pages @blogs.total_pages
