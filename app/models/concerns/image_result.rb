module ImageResult
  extend ActiveSupport::Concern
  def self.get_url(search_term)
    photo_id = Unsplash::Photo.search(search_term, 1, 1, :squarish)[0].id
    img_url = Unsplash::Photo.find(photo_id).add_utm_to_urls["small"]
    img_url.match(/^([^?]+)/)[0]
  end
end
