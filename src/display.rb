def display_trade_information(trades)
  printf("%2s %15s %15s %10s %3s %5s %7s %12s %12s %12s %20s %12s %35s %35s %27s\n","ID", "CounterParty", "Trader", "MTM Curve", "B/S", "Price", "Volume", "Tenor Start", "Tenor End", "Delivery", "Location", "Instrument", "Brokerage", "Tags", "Notes")
  trades.each do |trade_id, trade_details|
    printf("%2s %15s %15s %10s %3s %5s %7s %12s %12s %12s %20s %12s %35s %35s %27s\n","#{trade_id}",
     "#{trade_details[0]}", "#{trade_details[1]}", "#{trade_details[2]}", "#{trade_details[3]}", 
     "#{trade_details[4]}", "#{trade_details[5]}", "#{trade_details[6]}", "#{trade_details[7]}", 
     "#{trade_details[8]}", "#{trade_details[9]}", "#{trade_details[10]}", "#{trade_details[11]}",
     "#{trade_details[11]}", "#{trade_details[12]}")
  end
  puts ""
end

def display_price_curve_information(price_curves)
  price_curves.each do |trade_id, trade_details|
    printf("%10s %10s %10s\n", "#{trade_id}", "#{trade_details[0]}", "#{trade_details[1]}")
  end
end

def display_mtm(id, mtm_value)
  print("MTM Value for Trade #{id}: $#{format("%.2f", mtm_value)}\n")
end

def display_portfolio_worth(portfolio_worth)
  print("\nYour entire portfolio worth is: $#{portfolio_worth}\n\n")
end