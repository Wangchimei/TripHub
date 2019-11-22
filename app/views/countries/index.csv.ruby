require 'csv'

CSV.generate do |csv|
  column_names = %w(id name iso2 iso3 capital currency latitude longitude continent_id)
  csv << column_names
  @countries.each do |country|
    column_values = [
      country.id,
      country.name,
      country.iso2,
      country.iso3,
      country.capital,
      country.currency,
      country.latitude,
      country.longitude,
      country.continent_id
    ]
    csv << column_values
  end
end