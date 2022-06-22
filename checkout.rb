class Checkout
  def intialize(args = {})
  end

  def self.

  end

  def scan
    @items << item
  end

  def total
    sum = 0
    @items.each do |item|
      sum += item.price
    end
  end

  def promotional_rules

  end
end

class Item
  def initialize(product_code, name, price)
    @product_code = product_code
    @name = name
    @price = price
  end

end
