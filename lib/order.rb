
module Orders
  class Order
    attr_reader :raw_name, :unit, :qty, :up_cyr_name, :type, :size, :color, :version, :voltage, :standard

    COLORS_ARRAY = %w(КРАСН ОРАНЖ ЖЁЛТ ЖЕЛТ ЗЕЛЕН ЗЕЛЁН ГОЛУБ СИН ФИОЛЕТ КОРИЧН ЧЕРН ЧЁРН БЕЛ)
    TYPE_ARRAY = %w(ПЭТД ПЭТВ ПУГВ АПБ)
    VERSION_ARRAY = %w(ХЛ)

    def initialize(creator, raw_name:, unit:, qty:)
      @creator = creator
      @raw_name = raw_name
      @unit = unit
      @qty = qty

      @up_cyr_name = to_upcase_cyrilic @raw_name
      tail = String.new(@up_cyr_name)

      @voltage = parse_voltage tail
      tail.sub! @voltage.to_s, '' # cut voltage

      @color = parse_color tail
      tail.sub! @color.to_s, '' # cut color

      @standard = parse_standard tail
      tail.sub! @standard.to_s, '' # cut standard

      temp = parse_version tail
      if temp
        @version = temp[:version]
        tail.sub! temp[:cut], '' # cut version
      end

      temp = parse_type tail   
      if temp
        @type = temp[:type]
        tail.sub! temp[:cut], '' # cut version
      end

      # beleive that only size left
      @size = tail.strip 

    end

  def to_s
    "\n
     raw_name: #@raw_name
     up_cyr_name: #@up_cyr_name\n
     марка: #@type
     размер: #@size
     цвет: #@color
     исполнение: #@version
     напряжение: #@voltage
     технические условия или гост: #@standard
     единица измерения: #@unit
     количество: #@qty
     --------------------------------------------------"
  end


    private

    def to_upcase_cyrilic(str)
      return nil unless str
      up_cyr_str = str.upcase
      up_cyr_str.gsub('A','А')
      .gsub('B','В')
      .gsub('C','С')
      .gsub('E','Е')
      .gsub('H','Н')
      .gsub('K','К')
      .gsub('M','М')
      .gsub('O','О')
      .gsub('P','Р')
      .gsub('T','Т')
      .gsub('U','И')
      .gsub('V','В')
      .gsub('X','Х')
      .gsub('Y','У')
    end

    def parse_voltage(up_cyr_str)
      return nil unless up_cyr_str
      match=/\d+([.|,]\d+)?([-]?|\s*)[К|M]?В/.match up_cyr_str
      match[0] if match
    end

    def parse_color(up_cyr_str)
      return nil unless up_cyr_str
      match = /(#{COLORS_ARRAY.join('|')})\S*/.match up_cyr_str
      match[0] if match
    end

    def parse_standard(up_cyr_str)
      return nil unless up_cyr_str
      match = /(ТУ|ГОСТ)\s*\S*/.match up_cyr_str
      match[0] if match
    end

    def parse_version(up_cyr_str)
      return nil unless up_cyr_str
      match = /[-|\s](#{VERSION_ARRAY.join('|')})\s/.match up_cyr_str
      { version: match[1], cut: match[0] } if match
    end

    def parse_type(up_cyr_str)
      return nil unless up_cyr_str
      TYPE_ARRAY.each do |type|
        match = /\A\S*\s*(#{type}[-]\d+|#{type})[-]?/.match up_cyr_str
        return { type: match[1], cut: match[0] } if match
      end
      nil
    end


  end
end