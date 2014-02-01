Dir[Rails.root + 'app/aggregates/**/**/*.rb'].each do |file|
  require file
end