class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
