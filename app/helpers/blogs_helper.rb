module BlogsHelper
  def blog_list
    Blog.order('name').pluck('id', 'name').map do |(id, name)|
      [id, h(name)]
    end.to_json.html_safe
  end
end
