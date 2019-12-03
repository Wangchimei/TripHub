module ImageResult
  extend ActiveSupport::Concern
  def self.get_url(search_term)
    if Unsplash::Photo.search(search_term, 1, 1, :squarish)[0].nil?
      photo_id = Unsplash::Photo.search(search_term, 1, 1)[0].id
    else
      photo_id = Unsplash::Photo.search(search_term, 1, 1, :squarish)[0].id
    end
    img_url = Unsplash::Photo.find(photo_id).add_utm_to_urls["regular"]
    # img_url.match(/^([^?]+)/)[0]
  end
end
