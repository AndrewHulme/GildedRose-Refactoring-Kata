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

      it "At lowest quality" do
        items = [Item.new("Normal Item", 20, 0)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Normal Item"
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 0
      end

      it "At lowest quality and past sell in date" do
        items = [Item.new("Normal Item", -1, 0)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Normal Item"
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 0
      end
    end


    describe "Aged Brie" do
      it "Normal conditions" do
        items = [Item.new("Aged Brie", 20, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Aged Brie"
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 21
      end

      it "Past sell in date" do
        items = [Item.new("Aged Brie", -1, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Aged Brie"
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 22
      end

      it "Past sell in date again" do
        items = [Item.new("Aged Brie", -2, 22)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Aged Brie"
        expect(items[0].sell_in).to eq -3
        expect(items[0].quality).to eq 24
      end

      it "At highest quality" do
        items = [Item.new("Aged Brie", 20, 50)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Aged Brie"
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 50
      end

      it "At highest quality and past sell in date" do
        items = [Item.new("Aged Brie", -1, 50)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Aged Brie"
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 50
      end
    end


    describe "Sulfuras" do
      it "Normal conditions" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 20, 80)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Sulfuras, Hand of Ragnaros"
        expect(items[0].sell_in).to eq 20
        expect(items[0].quality).to eq 80
      end

      it "Past sell in date" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", -1, 80)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Sulfuras, Hand of Ragnaros"
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 80
      end
    end


    describe "Backstage Passes" do
      it "Normal conditions" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 21
      end

      it "Less than 10 days to sell in" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 22
      end

      it "Less than 10 days to sell in again" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[0].sell_in).to eq 5
        expect(items[0].quality).to eq 22
      end

      it "Less than 5 days to sell in" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 23
      end

      it "Less than 5 days to sell in again" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 23
      end

      it "Past sell in date" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 0
      end

      it "At highest quality" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 50)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 50
      end

      it "At highest quality and less than 10 days to sell in" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)]
        GildedRose.new(items).update_quality()

        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 50
      end

    end

  end

end
