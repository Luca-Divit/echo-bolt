class Checkout
  attr_reader :total, :basket, :prices, :spending_deal

  def initialize(args = {})
    @total = 0
    @basket = []
    @prices = args["prices"]
    @spending_deal = args["spending_deal"]
  end

  private

  def scan(item)
    if !@prices.keys.include? item
      puts " "
      return puts "Error this item is not in the list, try again."
      puts " "
    end
    if @basket.any? do |product|
        product["code"] == item
      end
      find_item = @basket.detect do |product|
        product["code"] == item
      end
      index = @basket.index(find_item)
      @basket[index]["quantity"] += 1
    else
      @basket << {"code" => item, "quantity" => 1}
    end
  end

  def total
    @basket.each_with_index do |product, index|
      @prices[product["code"]]["price"].each do |key, value|
        if product["quantity"] >= key.to_i
          @total += (product["quantity"] * value)
          break
        end
      end
    end
    total = @total > @spending_deal["min_spend"] ? 0.01 * @total * (100 - @spending_deal["percent_off"]) : @total
    total.round(2)
  end
end
