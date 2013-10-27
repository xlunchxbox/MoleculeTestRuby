require File.expand_path('../../src/read_csv.rb', __FILE__)
require File.expand_path('../../src/display.rb', __FILE__)
require File.expand_path('../../src/calculate.rb', __FILE__)
require File.expand_path('../../src/mtm.rb', __FILE__)


def mtm_for_entire_tenor_of_trade(settle_prices, price, volume, id)
  mtm_values = []
  settle_prices.each do |net_price|
    mtm_values << net_result(volume, net_value(price, net_price))
  end
  display_mtm(id, calculate_mark_to_market(mtm_values))
end


def get_settle_prices_for_tenor_length(price_curve, tenor_start, tenor_end, price, volume, id)
  settle_prices = []
  price_curve.each do |date, price|
    if (date >= tenor_start) && (date <= tenor_end)
      settle_prices << price[1]
      # print "#{tenor_start}\t #{tenor_end} \t#{date} \t #{price[1]}\n"
    end
  end
  mtm_for_entire_tenor_of_trade(settle_prices, price, volume, id)
end


def price_curve_router(portfolio, brent, ice, nymex)
  portfolio.each do |id, row|
    if row[2] == "BRENT"
      get_settle_prices_for_tenor_length(brent, row[6], row[7], row[4], row[5], id)
    elsif row[2] == "ICE WTI"
      get_settle_prices_for_tenor_length(ice, row[6], row[7], row[4], row[5], id)
    elsif row[2] == "NYMEX CL"
      get_settle_prices_for_tenor_length(nymex, row[6], row[7], row[4], row[5], id)
    end
  end
end

portfolio = process_portfolio("db/trades.csv")

brent = process_price_curve("db/ice_brent.csv", "BRENT WTI", 0, 4)
ice = process_price_curve("db/ice_wti.csv", "ICE WTI", 0, 4)
nymex = process_price_curve("db/nymex.csv", "NYMEX CL", 0, 6)








display_trade_information(portfolio)
price_curve_router(portfolio, brent, ice, nymex)