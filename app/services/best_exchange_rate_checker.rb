class BestExchangeRateChecker
    def self.go
        most_recent_exchange_rate_record = ExchangeRate.last

        if is_lowest?(most_recent_exchange_rate_record.rate)
            MailSender.send!(most_recent_exchange_rate_record)
        end
    end

    def self.is_lowest?(new_rate)
        # get all the rates - not including the last rate that we just inserted into the db
        current_best_rate = ExchangeRate.all[0..-2].collect(&:rate).min

        current_best_rate.to_f > new_rate
    end
    private_class_method :is_lowest?
end