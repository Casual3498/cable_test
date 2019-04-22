
module Orders
  class Order
    attr_reader :raw_name, :unit, :qty, :up_cyr_name, :type, :size, :color, :version, :voltage, :standard

    def initialize(creator, raw_name:, unit:, qty:)
      @creator = creator
      @raw_name = raw_name
      @unit = unit
      @qty = qty
      @up_cyr_name = to_upcase_cyrilic @raw_name

      # @voltage = parse_voltage @up_cyr_name


    end


    private

    def to_upcase_cyrilic(str)
      up_cyr_str = str.upcase
      up_cyr_str.gsub!('A','А')
      .gsub!('B','В')
      .gsub!('C','С')
      .gsub!('E','Е')
      .gsub!('H','Н')
      .gsub!('K','К')
      .gsub!('M','М')
      .gsub!('O','О')
      .gsub!('P','Р')
      .gsub!('T','Т')
      .gsub!('U','И')
      .gsub!('V','В')
      .gsub!('X','Х')
      .gsub!('Y','У')
    end

    # def parse_voltage(str)
    #   ary
    # end


  end
end