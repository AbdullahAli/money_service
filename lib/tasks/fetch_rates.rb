require 'open-uri'

class FetchRates
    BUYBACK_URL = 'https://www.thomasexchange.co.uk/buyback.asp'
    RATE_CSS_PATH = '#best_deals > tr:nth-child(2) > td:nth-child(2) > a'
    RATE_REGEX = /(?:U.S.A - Dollar)(.*)/

    def self.go
        doc = Nokogiri::HTML(open(BUYBACK_URL))
        result = doc.css(RATE_CSS_PATH).text
        rate = RATE_REGEX.match(result)[1]

        Rails.logger.info("fetched new rate...")
        ExchangeRate.create!(rate: rate)
    end
end