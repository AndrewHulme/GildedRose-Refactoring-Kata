class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()

    @items.each do |item|

      # this if handles the quality
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" and item.name != "Sulfuras, Hand of Ragnaros"
        item.quality = item.quality - 1 if item.quality > 0
      elsif item.quality < 50
        item.quality = item.quality + 1

        if item.name == "Backstage passes to a TAFKAL80ETC concert" and item.sell_in < 6 and item.quality < 50
          item.quality = item.quality + 2
        elsif item.name == "Backstage passes to a TAFKAL80ETC concert" and item.sell_in < 11 and item.quality < 50
          item.quality = item.quality + 1
        end

      end


      # this if handles the sell in
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end

      # this if amends the quality if the sell in has passed
      if item.sell_in < 0 and item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"

        if item.quality > 0 and item.name != "Sulfuras, Hand of Ragnaros"
          item.quality = item.quality - 1
        end

      elsif item.sell_in < 0 and item.name != "Aged Brie" and item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.quality = item.quality - item.quality

      elsif item.sell_in < 0 and item.quality < 50

        item.quality = item.quality + 1

      end


    end
  end
end




class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
