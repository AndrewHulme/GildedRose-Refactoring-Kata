class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()

    @items.each do |item|
      if item_type_normal(item) and item.quality > 0
        item.sell_in <= 0 ? item.quality -= 2 : item.quality -= 1
      elsif item_type_conjured(item)
        item.sell_in <= 0 ? item.quality -= 4 : item.quality -= 2

      elsif item_type_backstage_pass(item)
        if item.sell_in <= 0
          item.quality = 0
        elsif item.sell_in < 6
          item.quality += 3
        elsif item.sell_in < 11
          item.quality += 2
        else
          item.quality += 1
        end

      elsif item_type_aged_brie(item) and item.quality > 0
        item.sell_in <= 0 ? item.quality += 2 : item.quality += 1
      end

      catch_quality_outliers(item)

      update_sell_in(item)
    end

  end


  private

  def catch_quality_outliers(item)
    if item.quality > 50 and item.quality < 80
      item.quality = 50
    elsif item.quality < 0
      item.quality = 0
    end
  end

  def update_sell_in(item)
    item.sell_in -= 1 if !item_type_sulfuras(item)
  end

  def item_type_normal(item)
    !item_type_aged_brie(item) and !item_type_backstage_pass(item) and !item_type_sulfuras(item) and !item_type_conjured(item)
  end

  def item_type_conjured(item)
    item.name == "Conjured Mana Cake"
  end

  def item_type_backstage_pass(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def item_type_aged_brie(item)
    item.name == "Aged Brie"
  end

  def item_type_sulfuras(item)
    item.name == "Sulfuras, Hand of Ragnaros"
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
