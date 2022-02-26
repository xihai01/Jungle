require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.create(name: "Appliances")
    end

    it 'saves successfully with validation fields set' do
      @product = Product.new(category_id: @category.id, name: "microwave", description: "This is a microwave.", image: "micro.png", price_cents: 2000, quantity: 40)
      # without !, model validations are bypassed
      expect(@product.save!).to be_truthy
    end

    it 'not save for empty name field' do
      @product = Product.new(category_id: @category.id, name: nil, price_cents: 3000, quantity: 12)
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'not save for empty price field' do
      @product = Product.new(category_id: @category.id, name: "microwave", price_cents: nil, quantity: 22)
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it 'not save for empty quantity field' do
      @product = Product.new(category_id: @category.id, name: "microwave", price_cents: 9000, quantity: nil)
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'not save for empty category id field' do
      @product = Product.new(category_id: nil, name: "microwave", price_cents: 10000, quantity: 3232)
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end
  end
end
