require 'csv'
require 'date'

def process_date(string_date)
  parsed_date = Date.parse string_date
end

def process_portfolio(filename)
  trades_list = Hash.new
  CSV.open(filename, 'r', {:headers => true}).each do |row|
    trades_list[row[0].to_i] = [row[1], row[2], row[3], row[4], row[5].to_f, row[6].to_i, process_date(row[7]), 
      process_date(row[8]), row[9], row[10], row[11], row[12], row[13]]
  end
  trades_list
end

def process_price_curve(filename, price_curve_type, month_year_column, settle_price_column)
  price_curves_list = Hash.new
  CSV.open(filename, 'r', {:headers => true}).each do |row|    
    price_curves_list[process_date(row[month_year_column])] = [price_curve_type, row[settle_price_column].to_f]
  end
  price_curves_list.sort
end