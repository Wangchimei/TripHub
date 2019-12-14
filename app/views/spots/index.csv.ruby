require 'csv'

CSV.generate do |csv|
  column_names = %w(id name address admission_fee duration latitude longitude main_image formatted_name formatted_address phone_num rating website place_id)
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
      spot.main_image,
      spot.formatted_name,
      spot.formatted_address,
      spot.phone_num,
      spot.rating,
      spot.website,
      spot.place_id,
    ]
    csv << column_values
  end
end