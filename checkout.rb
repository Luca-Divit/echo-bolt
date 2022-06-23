class Checkout
  attr_reader :total, :basket, :items, :spending_deal

  def initialize(args = {})
    @total = 0
    @basket = []
    @items = args['items']
    @spending_deal = args['spending_deal']
  end

  private

  # If an item is already in the basket add one quantity otherwise add item
  def scan(item)
    if !@items.keys.include? item
      puts 'Error this item is not in the list, try again.'
    end
    if @basket.any? do |product|
        product['code'] == item
      end
      find_item = @basket.detect do |product|
        product['code'] == item
      end
      index = @basket.index(find_item)
      @basket[index]['quantity'] += 1
    else
      @basket << {'code' => item, 'quantity' => 1}
    end
  end

  # Apply discount in case total is more than the minimum spending discount
  def total_after_discount
    @basket.each_with_index do |product, index|
      @items[product['code']]['price'].each do |key, value|
        if product['quantity'] >= key.to_i
          @total += (product['quantity'] * value)
          break
        end
      end
    end
    total_after_discount = @total > @spending_deal['min_spend'] ? 0.01 * @total * (100 - @spending_deal['percent_off']) : @total
    total_after_discount.round(2)
  end
end
