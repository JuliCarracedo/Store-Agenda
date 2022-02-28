require 'rails_helper'

RSpec.describe Item, :type => :model do
    it "is valid with valid attributes" do
        item = Item.new(code:'MUG',name:'Reedsy Mug', price: 1000)
        expect(item).to be_valid
      end

    it "will reject negative prices" do
        item = Item.new(code:'MUG',name:'Reedsy Mug', price: -1000)
        expect(item).to_not be_valid
    end

    it "will reject an item without price" do
        item = Item.new(code:'MUG',name:'Reedsy Mug')
        expect(item).to_not be_valid
    end

    it "will reject items without code" do
        item = Item.new(name:'Reedsy Mug', price: 1000)
        expect(item).to_not be_valid
    end

    it "will reject items without name" do
        item = Item.new(code:'MUG', price: 1000)
        expect(item).to_not be_valid
    end

    it "will reject names longer than 25 digits" do
        item = Item.new(code:'MUG',name: 'John Fitzgerald Marcus Jameson Jonas the Third', price: 1000)
        expect(item).to_not be_valid
    end

    it "will reject empty names" do
        item = Item.new(code:'MUG',name: '', price: 1000)
        expect(item).to_not be_valid
    end

    it "will reject empty codes" do
        item = Item.new(code:'', name:'Blank field', price: 1000)
        expect(item).to_not be_valid
    end
  end