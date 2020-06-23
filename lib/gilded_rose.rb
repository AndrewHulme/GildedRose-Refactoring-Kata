class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      update_normal_quality(item) if (item_type_normal(item) and item.quality > 0)
      update_aged_brie_quality(item) if (item_type_aged_brie(item) and item.quality > 0)
      update_conjured_quality(item) if item_type_conjured(item)
      update_backstage_pass_quality(item) if item_type_backstage_pass(item)
      catch_quality_outliers(item)
      update_sell_in(item)
    end
  end

  private

  def update_normal_quality(item)
    item.sell_in <= 0 ? item.quality -= 2 : item.quality -= 1
  end

  def update_aged_brie_quality(item)
    item.sell_in <= 0 ? item.quality += 2 : item.quality += 1
  end

  def update_backstage_pass_quality(item)
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality = 0 if item.sell_in <= 0
  end

  def update_conjured_quality(item)
    item.sell_in <= 0 ? item.quality -= 4 : item.quality -= 2
  end

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
