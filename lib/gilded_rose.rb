class GildedRose

  def initialize(items)
    @items = items
  end

  def catch_quality_outliers(item)
    if item.quality > 50 and item.quality < 80
      item.quality = 50
    elsif item.quality < 0
      item.quality = 0
    end
  end

  def update_sell_in(item)
    item.sell_in = item.sell_in - 1 if item.name != "Sulfuras, Hand of Ragnaros"
  end


  def update_quality()

    @items.each do |item|

      # this if handles the quality
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" and item.name != "Sulfuras, Hand of Ragnaros" and item.quality > 0
        item.sell_in <= 0 ? item.quality = item.quality - 2 : item.quality = item.quality - 1

      elsif item.sell_in <= 0 and item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.quality = 0

      elsif item.name == "Backstage passes to a TAFKAL80ETC concert" and item.sell_in < 6 and item.quality < 50
        item.quality = item.quality + 3

      elsif item.name == "Backstage passes to a TAFKAL80ETC concert" and item.sell_in < 11 and item.quality < 50
        item.quality = item.quality + 2

      # for (item.name == "Aged Brie" or item.name == "Backstage passes to a TAFKAL80ETC concert")
      elsif item.quality < 50 and item.quality > 0
        item.sell_in <= 0 ? item.quality = item.quality + 2 : item.quality = item.quality + 1
      end

      catch_quality_outliers(item)

      update_sell_in(item)

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
