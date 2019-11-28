require 'csv'

CSV.generate do |csv|
  column_names = %w(id name address admission_fee duration latitude longitude)
  csv << column_names
  @spots.each do |spot|
    column_values = [
      spot.id,
      spot.name,
      spot.address,
      spot.admission_fee,
      spot.duration,
      spot.latitude,
      spot.longitude,
    ]
    csv << column_values
  end
end