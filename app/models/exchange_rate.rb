class ExchangeRate < ActiveRecord::Base
    # GBP to USD.  Since we have USD, lower is better!
    attr_accessible :rate

    def self.print(order = 'rate desc')
        self.order(order).each do |exchange_rate_record|
            puts "time: #{exchange_rate_record.created_at} rate: #{exchange_rate_record.rate}"
        end
    end
end
