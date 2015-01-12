module BlogsHelper
  def blog_list
    Blog.all.pluck('id', 'name').map do |(id, name)|
      [id, h(name)]
    end.to_json.html_safe
  end
end
