require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should save successfully" do
      @category = Category.create(name: 'Clothing')
      @product = @category.products.create(name: 'shoes', description: 'test', image: 'test', price_cents: 20000, quantity: 2)
      expect(@product).to be_valid
      @product.errors.full_messages
    end

    it "name presence" do
      @category = Category.create(name: 'Clothing')
      @product = @category.products.create(name: nil, description: 'test', image: 'test', price_cents: 20000, quantity: 2)
      expect(@product).not_to be_valid
      @product.errors.full_messages
    end

    it "price_cents presence" do
      @category = Category.create(name: 'Clothing')
      @product = @category.products.create(name: 'shoes', description: 'test', image: 'test', price_cents: nil, quantity: 2)
      expect(@product).not_to be_valid
      @product.errors.full_messages
    end

    it "quantity presence" do
      @category = Category.create(name: 'Clothing')
      @product = @category.products.create(name: 'shoes', description: 'test', image: 'test', price_cents: 20000, quantity: nil)
      expect(@product).not_to be_valid
      @product.errors.full_messages
    end

    it "category presence" do
      @product = Product.create(name: 'shoes', description: 'test', image: 'test', price_cents: 20000, quantity: 2)
      expect(@product).not_to be_valid
      @product.errors.full_messages
    end
  end
end

