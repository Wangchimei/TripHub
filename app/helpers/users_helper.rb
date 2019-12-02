module UsersHelper
  def visited_countries_array
    visited_countries = []
    current_user.countries_conquered.each do |country|
      visited_countries << country.iso2
    end
    visited_countries
  end
end
