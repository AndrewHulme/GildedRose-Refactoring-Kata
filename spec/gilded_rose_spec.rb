# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    describe "Normal item" do

      it "Normal conditions" do
        items = [Item.new("Normal Item", 20, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Normal Item"
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 19
      end

      it "Past sell in date" do
        items = [Item.new("Normal Item", -1, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Normal Item"
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 18
      end

      it "Past sell in date again" do
        items = [Item.new("Normal Item", -2, 18)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Normal Item"
        expect(items[0].sell_in).to eq -3
        expect(items[0].quality).to eq 16
      end
    end
  end

end

# items = [Item.new("foo", 0, 0)]
# GildedRose.new(items).update_quality()
# expect(items[0].name).to eq "fixme"
