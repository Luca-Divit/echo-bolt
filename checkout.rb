class Checkout
  attr_reader :total, :basket, :prices, :spending_deal

  def initialize(args = {})
    @total = 0
    @basket = []
    @prices = args["prices"]
    @spending_deal = args["spending_deal"]
  end



end
