class GildedRose

  def initialize(items)
    @items = items
    @agedbrie = "Aged Brie"
    @backstagepass = "Backstage passes to a TAFKAL80ETC concert"
    @sulfuras = "Sulfuras, Hand of Ragnaros"
    @conjured = "Conjured Mana Cake"
  end

  def update_quality()

    @items.each do |item|
      if item_normal(item) and item.quality > 0
        item.sell_in <= 0 ? item.quality -= 2 : item.quality -= 1
      elsif item_conjured(item)
        item.sell_in <= 0 ? item.quality -= 4 : item.quality -= 2
      elsif item_backstage_pass(item) and item.sell_in <= 0
        item.quality = 0
      elsif item_backstage_pass(item) and item.sell_in < 6
        item.quality += 3
      elsif item_backstage_pass(item) and item.sell_in < 11
        item.quality += 2
      elsif item.name != @sulfuras and item.quality > 0
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
    item.sell_in -= 1 if item.name != @sulfuras
  end

  def item_normal(item)
    item.name != @agedbrie and item.name != @backstagepass and item.name != @sulfuras and item.name != @conjured
  end

  def item_conjured(item)
    item.name == @conjured
  end

  def item_backstage_pass(item)
    item.name == @backstagepass
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
