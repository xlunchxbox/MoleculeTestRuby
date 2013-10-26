require File.expand_path('../../src/read_csv.rb', __FILE__)



def display_trade_information(trades)
  trades.each do |trade_id, trade_details|
    printf("%3s %15s %15s %10s %3s %5s %8s %10s %10s %10s %20s %12s %15s %30s %30s\n","#{trade_id}",
     "#{trade_details[0]}", "#{trade_details[1]}", "#{trade_details[2]}", "#{trade_details[3]}", 
     "#{trade_details[4]}", "#{trade_details[5]}", "#{trade_details[6]}", "#{trade_details[7]}", 
     "#{trade_details[8]}", "#{trade_details[9]}", "#{trade_details[10]}", "#{trade_details[11]}",
     "#{trade_details[11]}", "#{trade_details[12]}","#{trade_details[13]}")
  end
end

def display_price_curve_information(price_curves)
  price_curves.each do |trade_id, trade_details|
    printf("%10s %10s %10s\n", "#{trade_id}", "#{trade_details[0]}", "#{trade_details[1]}")
  end
end

display_trade_information(process_portfolio("db/trades.csv"))


display_price_curve_information(process_price_curve("db/ice_brent.csv", "BRENT WTI", 0, 4))
display_price_curve_information(process_price_curve("db/ice_wti.csv", "ICE WTI", 0, 4))
display_price_curve_information(process_price_curve("db/nymex.csv", "NYMEX CL", 0, 6))