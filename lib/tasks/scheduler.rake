desc "fetch money exhchange rate"

task :do_everything => :environment do
  puts "starting rake..."

  # fetch the rates
  puts "started fetching rates.."
  FetchRates.go
  puts "finished fetching rates.."


  # email me if the fetched newly fetched rate is the lowest
  puts "started best rate checker..."
  BestExchangeRateChecker.go
  puts "finished best rate checker..."

  puts "finished rake..."
end