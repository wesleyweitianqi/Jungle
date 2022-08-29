require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    it "should save successfully with all four fields set" do
      @category = Category.new(
        id: 5,
        name: 'test'
      )
      @product = Product.new(
        name: "wesley", 
        price: 100, 
        quantity: 5, 
        category_id: 5
        )
      @category.products = [@product]
      @product.save
      expect(@product).to be_valid
    end

    it "should not be valid if name is empty" do
      @category = Category.new(
        id: 5,
        name: 'test'
      )
      @product = Product.new(
        name: nil,
        price: 100, 
        quantity: 5, 
        category_id: 5
        )
      @category.products = [@product]
      @product.save
      expect(@product.errors.full_messages.length).to eql(1)
      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
      expect(@product).to_not be_valid
    end 

    it "should not be valid if price is not a number" do
      @category = Category.new(
        id: 5,
        name: 'test'
      )
      @product = Product.new(
        name: 'wesley',
        price: 'hello', 
        quantity: 5, 
        category_id: 5
        )
      @category.products = [@product]
      @product.save
      expect(@product.errors.full_messages[0]).to eql("Price is not a number")
      expect(@product).to_not be_valid
    end 

    it "should not be valid if quantity is empty" do
      @category = Category.new(
        id: 5,
        name: 'test'
      )
      @product = Product.new(
        name: 'wesley',
        price: 100, 
        category_id: 3
        )
      @product.category = @category
      @product.save
      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
      expect(@product).to_not be_valid
    end 

    it "should not be valid if category is empty" do
      @product = Product.new(
        name: 'wesley',
        price: 100, 
        quantity: 5
        )
      @product.save
      expect(@product.errors.full_messages[1]).to eql("Category can't be blank")
      expect(@product).to_not be_valid
    end 

  end 
end
