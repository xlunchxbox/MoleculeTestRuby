require File.expand_path('../../src/mtm.rb', __FILE__)

def get_settle_prices_for_tenor_length(price_curve, tenor_start, tenor_end)
  settle_prices = []
  price_curve.each do |date, price|
    if (date >= tenor_start - 30) && (date <= tenor_end)
      settle_prices << price[1]
    end
  end
  settle_prices
end

def mtm_for_entire_tenor_of_trade(settle_prices, price, volume)
  mtm_values = []
  settle_prices.each do |net_price|
    mtm_values << net_result(volume, net_value(price, net_price))
  end
  mtm_values
end
