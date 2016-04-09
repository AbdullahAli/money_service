desc "fetch money exhchange rate"

task :do_everything do
  # fetch the rates
  FetchRates.go

  # email me if the fetched newly fetched rate is the lowest
  BestExchangeRateChecker.go
end