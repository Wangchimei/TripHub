module ImageResult
  extend ActiveSupport::Concern
  def self.get_url(img)
    url= img.add_utm_to_urls["regular"]
    url.match(/^([^?]+)/)[0]
  end
end
