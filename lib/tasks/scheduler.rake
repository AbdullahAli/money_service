desc "fetch money exhchange rate"

task :fetch_exchange_rate => :environment do
  FetchRates.go
end