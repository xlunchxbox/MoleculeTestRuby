def net_value(price, market_price)
  price - market_price
end

def net_result(volume, net_value)
  volume * net_value
end

def calculate_mark_to_market(net_results)
  net_results.inject(0, :+)
end

