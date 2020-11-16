require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should save successfully" do
      @product = Product.new
      @product.name = 'Test'
      @product.price_cents = 123
      @product.quantity = 2
      @product.category_id = 1
      expect(@product).to be_present
    end

    it "name presence" do
      @product = Product.new
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "price_cents presence" do
      @product = Product.new
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "quantity presence" do
      @product = Product.new
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "category_id presence" do
      @product = Product.new
      @product.category_id = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

