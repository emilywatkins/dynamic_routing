require('rspec')
require('pry')
require('item')

describe("Item") do
  before() do
    Item.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      item = Item.new("tacos", 1)
      item.save()
      expect(Item.all()).to(eq([item]))
    end
  end

  describe(".includes") do
    it("check to make sure that the same item can't be added twice") do
      item = Item.new("tacos", 2)
      item.save()
      item2 = Item.new("tacos", 1)
      item2.save()
      expect(Item.all()).to(eq(false))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos", 1)
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      item = Item.new("tacos", 1)
      item.save()
      item2 = Item.new("pizza", 2)
      item2.save()
      expect(item.id()).to(eq(1))
      expect(item2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds an item based on its id") do
      item = Item.new("tacos", 1)
      item.save()
      item2 = Item.new("pizza", 2)
      item2.save()
      expect(Item.find(1)).to(eq(item))
      expect(Item.find(2)).to(eq(item2))
    end
  end

  describe(".sort") do
    it("sorts list of favorite things by ranking from 0-10") do
      item = Item.new("tacos", 2)
      item.save()
      item2 = Item.new("pizza", 1)
      item2.save()
      expect(Item.sort()).to(eq([item2, item]))
    end
  end
end
