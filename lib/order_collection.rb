require 'csv'
require './lib/order.rb'

module Orders
  class OrderCollection
    include Enumerable
    
    def each(&block)
      @orders_array.each do |member|
        block.call(member)
      end
    end
    
    KEYS_ARRAY = %i(raw_name unit qty)

    def initialize (filename = 'заявка.csv')
      @orders_array = CSV.read(filename, col_sep: ';', headers: KEYS_ARRAY).map.with_index do |string,i| 
        Order.new(self, string.to_h) if i > 0
      end
      @orders_array.shift # remove headers
    end

    def to_s
      @orders_array.join("\n")
    end

    def all
      @orders_array
    end


  end
end