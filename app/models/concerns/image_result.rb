module ImageResult
  extend ActiveSupport::Concern
  def self.get_url(search_term)
    connection = Unsplash::Photo.search(search_term).class
    if connection != Unsplash::SearchResult
      img_url = "https://imgur.com/PIz5jBj.png"
    elsif Unsplash::Photo.search(search_term, 1, 1, :squarish)[0].nil?
      photo_id = Unsplash::Photo.search(search_term, 1, 1)[0].id
      img_url = Unsplash::Photo.find(photo_id).add_utm_to_urls["regular"]
    else
      photo_id = Unsplash::Photo.search(search_term, 1, 1, :squarish)[0].id
      img_url = Unsplash::Photo.find(photo_id).add_utm_to_urls["regular"]
    end
    # img_url.match(/^([^?]+)/)[0]
  end
end
