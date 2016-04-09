class MailSender
    def self.send!(exchange_rate_record)
        Rails.logger.info("started to send best rate email...")

        Mail.deliver do
          to ENV['EMAIL']
          from ENV['EMAIL']
          subject 'New lowest rate found!'
          body "time: #{exchange_rate_record.created_at} rate: #{exchange_rate_record.rate}"
        end

        Rails.logger.info("finished sending best rate email...")
    end
end