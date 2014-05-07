def stockpicker(prices)
  max_diff = 0
  days = []
  prices.each_index do |buy_day|
    prices.each_index do |sell_day|
      next if sell_day < buy_day
    diff = prices[sell_day] - prices[buy_day]
      if (diff > max_diff)
        days = [buy_day, sell_day]
        max_diff = diff
      end
    end    
  end
  days
end