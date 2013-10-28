require File.expand_path('../../src/read_csv.rb', __FILE__)
require File.expand_path('../../src/display.rb', __FILE__)
require File.expand_path('../../src/calculate.rb', __FILE__)


portfolio = process_portfolio("db/trades.csv")

brent = process_price_curve("db/ice_brent.csv", "BRENT WTI", 0, 4)
ice = process_price_curve("db/ice_wti.csv", "ICE WTI", 0, 4)
nymex = process_price_curve("db/nymex.csv", "NYMEX CL", 0, 6)

display_trade_information(portfolio)

portfolio_worth = []

portfolio.each do |id, row|
  if row[2] == "BRENT"
    settle_prices = get_settle_prices_for_tenor_length(brent, row[6], row[7])
    mtm_values = mtm_for_entire_tenor_of_trade(settle_prices, row[4], row[5])
    tenor_mtm = calculate_mark_to_market(mtm_values)
    portfolio_worth << tenor_mtm
    display_mtm(id, tenor_mtm)
  elsif row[2] == "ICE WTI"
    settle_prices = get_settle_prices_for_tenor_length(ice, row[6], row[7])
    mtm_values = mtm_for_entire_tenor_of_trade(settle_prices, row[4], row[5])
    tenor_mtm = calculate_mark_to_market(mtm_values)
    portfolio_worth << tenor_mtm
    display_mtm(id, tenor_mtm)
  elsif row[2] == "NYMEX CL"
    settle_prices = get_settle_prices_for_tenor_length(nymex, row[6], row[7])
    mtm_values = mtm_for_entire_tenor_of_trade(settle_prices, row[4], row[5])
    tenor_mtm = calculate_mark_to_market(mtm_values)
    portfolio_worth << tenor_mtm
    display_mtm(id, tenor_mtm)
  end
end

display_portfolio_worth(calculate_mark_to_market(portfolio_worth))