class AddCurrencyColumnToPaymentSettings < ActiveRecord::Migration
  def up
    add_column :payment_settings, :minimum_price_currency, :text, after: :minimum_price_cents
    add_column :payment_settings, :minimum_transaction_fee_currency, :text, after: :minimum_transaction_fee_cents
    sql = "UPDATE communities c, payment_settings s
           SET s.minimum_price_currency = c.available_currencies,
               s.minimum_transaction_fee_currency = c.available_currencies
           WHERE c.id = s.community_id"
    exec_update(sql, "Copy currency", [])
  end

  def down
    remove_column :payment_settings, :minimum_price_currency
    remove_column :payment_settings, :minimum_transaction_fee_currency
  end
end
