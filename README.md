# Gilded Rose Refactoring Kata

## Project description
Gilded Rose is a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison.

Buy and sell the finest goods.

Goods degrade in quality over time and have a sell by date.
- All items have a SellIn value which denotes the number of days we have to sell the items
- All items have a Quality value which denotes how valuable the item is

Already a system/code in place to adjust quality and sell by date. For most items the system lowers both values for each item at the end of every day.

Exceptions to this rule:
- Once the sell by date has passed, Quality degrades twice as fast
- Quality of an item is never negative (0 is the minimum)
- "Aged Brie" actually increases in Quality the older it gets
- Quality of an item is never more than 50
- "Sulfuras", being a legendary item, has no SellIn date and doesn't decrease in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

New items to the inventory are conjured items:
- "Conjured" items degrade in Quality twice as fast as normal items

Other things to note
- Can change UpdateQuality method
- Can add any new code (so long as everything still works correctly)
- DO NOT alter the item class or items property
- Can make UpdateQuality and items property class methods/static if you want
- Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.




## Plan
1. Add automated tests for the existing code (using the requirements)

2. Refactor the existing code

3. Add the new feature
