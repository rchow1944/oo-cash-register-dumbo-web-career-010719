
require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :prices

  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(title, price, quantity = 1)
    self.items.fill(title, self.items.count, quantity)
    self.prices.fill(price, self.prices.count, quantity)
    self.total += price * quantity
  end

  def apply_discount
    # binding.pry
    if self.discount <= 0
      return "There is no discount to apply."
    end

    self.total *= 1-(self.discount/100.0).round(2)
    "After the discount, the total comes to $#{self.total.to_i}."
  end

  def void_last_transaction
    self.total -= prices.pop
  end
end
