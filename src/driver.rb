require File.expand_path('../../src/read_csv.rb', __FILE__)
require File.expand_path('../../src/display.rb', __FILE__)



display_trade_information(process_portfolio("db/trades.csv"))

# display_price_curve_information(process_price_curve("db/ice_brent.csv", "BRENT WTI", 0, 4))
# display_price_curve_information(process_price_curve("db/ice_wti.csv", "ICE WTI", 0, 4))
# display_price_curve_information(process_price_curve("db/nymex.csv", "NYMEX CL", 0, 6))