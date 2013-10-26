require 'simplecov'
SimpleCov.start

require 'rspec'
require File.expand_path('../../src/mtm.rb', __FILE__)

describe 'mtm' do
  
  describe 'computational logic' do
    describe 'subtraction' do
      it 'subtracting a smaller positive number from a bigger positive number should return a positive number' do
        10 == net_value(20, 10).should 
      end
    
      it 'subtracting a bigger positive number from a smaller positive number should return a negative number' do
        -10 == net_value(10, 20).should
      end
    
      it 'subtracting a smaller negative number from a bigger negative number should return a negative number' do
        -10 == net_value(-20, -10).should 
      end
    
      it 'subtracting a bigger negative number from a smaller negative number should return a positive number' do
        10 == net_value(-10, -20).should
      end
    
      it 'subtracting a smaller positive number from a bigger negative number should return a negative number' do
        -30 == net_value(-20, 10).should
      end
    
      it 'subtracting a bigger negative number from a smaller positive number should return a positive number' do
        30 == net_value(10, -20).should
      end
    
      it 'subtracting a smaller negative number from a bigger positive number should return a positive number' do
        30 == net_value(20, -10).should
      end
      
      it 'subtracting a bigger positive number from a smaller negative number should return a positive number' do
        -30 == net_value(-10, 20).should
      end
      
    end
    
    describe 'multiplication' do
      it 'multiplying two positive numbers should return a positive number' do
        100 == net_result(10, 10).should
      end
      
      it 'multiplying two negative numbers should return a positive number' do
        100 == net_result(-10, -10).should
      end
      
      it 'multiplying one positive number and one negative should return a negative number' do
        -100 == net_result(10, -10).should
      end
      
      it 'multiplying one negative number and one positive should return a negative number' do
        -100 == net_result(-10, 10).should
      end
      
    end
    
    describe 'calculate mark to market value' do
      net_result_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      empty_net_result_list = []
      
      it 'sending an empty array of net results should return 0' do
        0 == calculate_mark_to_market(empty_net_result_list).should
      end
      
      it 'sending an empty array of net results should return 0' do
        55 == calculate_mark_to_market(net_result_list).should
      end
      
    end
    
  end
  
end