class MailSender
    def self.send!(exchange_rate_record)
        Mail.deliver do
          to ENV['EMAIL']
          from ENV['EMAIL']
          subject 'New lowest rate found!'
          body "time: #{exchange_rate_record.created_at} rate: #{exchange_rate_record.rate}"
        end
    end
end