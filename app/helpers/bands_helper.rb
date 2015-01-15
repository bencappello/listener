module BandsHelper
  def band_list
    bands = Band.order('name').pluck('id', 'name').map do |(id, name)|
      [id, h(name)]
    end.to_json.html_safe
  end
end
