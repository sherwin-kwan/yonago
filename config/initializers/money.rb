# frozen_string_literal: true

Money.locale_backend = :currency
# Have to set the Stripe currency separately, in carts/show.html.erb and order_controller.rb
Money.default_currency = Money::Currency.new("CAD")
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

MoneyRails.configure do |config|
  config.no_cents_if_whole = false
  # config.default_format = {
  #   no_cents_if_whole: nil,
  #   symbol: nil,
  #   sign_before_symbol: nil
  # }
end
