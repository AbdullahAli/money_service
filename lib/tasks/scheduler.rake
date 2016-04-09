desc "fetch money exhchange rate"

task :do_everything => :environment do
  Rails.logger.info("starting rake...")

  # fetch the rates
  Rails.logger.info("started fetching rates..")
  FetchRates.go
  Rails.logger.info("finished fetching rates..")


  # email me if the fetched newly fetched rate is the lowest
  Rails.logger.info("started best rate checker...")
  BestExchangeRateChecker.go
  Rails.logger.info("finished best rate checker...")

  Rails.logger.info("finished rake...")
end