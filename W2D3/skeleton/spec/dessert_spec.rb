require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) {Dessert.new}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type.class).to be(String)
    end

    it "sets a quantity" do
      expect(actual).to be > 0
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect(dessert.quantity.class).to be(Integer)
    end
  end
end
  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('Something')
      expect(dessert.ingredients.empty?).to be(false)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      test = ingredients
      dessert.mix!
      expect(test).to_not eq(dessert.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to be(9)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        dessert.eat(11)
      end.to raise_error("not enough left!")
      end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:name).and_return("Pop")

      expect(dessert.serve).to include("Pop")
      end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
