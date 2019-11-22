require 'csv'

CSV.generate do |csv|
  column_names = %w(id name country_code state_code latitude longitude country_id)

  csv << column_names
  @states.each do |state|
    column_values = [
      state.id,
      state.name,
      state.country_code,
      state.state_code,
      state.latitude,
      state.longitude,
      state.country_id
    ]
    csv << column_values
  end
end