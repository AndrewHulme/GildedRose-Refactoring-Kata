# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "Normal item, normal conditions" do
      items = [Item.new("Normal Item", 20, 20)]
      GildedRose.new(items).update_quality()

      expect(items[0].name).to eq "Normal Item"
      expect(items[0].sell_in).to eq 19
      expect(items[0].quality).to eq 19
    end
  end

end

# items = [Item.new("foo", 0, 0)]
# GildedRose.new(items).update_quality()
# expect(items[0].name).to eq "fixme"
