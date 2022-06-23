require_relative '../lib/checkout.rb'

describe Checkout do
  promotional_rules = {
    'items' => {
      '001' => {
        'name' => 'lavander heart',
        'price' => {
          '2' => 8.5,
          '1' => 9.25
        }
      },
      '002' => {
        'name' => 'personalized cufflinks',
        'price' => {
          '1' => 45.00
        }
      },
      '003' => {
        'name' => 'kids t-shirt',
        'price' => {
          '1' => 19.95
        }
      }
    },
    'spending_deal' => {
      'min_spend' => 60,
      'percent_off' => 10
    }
  }

  describe 'Checkout' do
    context 'given some items should include them the basket' do
      it 'returns an array of hashes with code of the product and the quantity' do
        co = Checkout.new(promotional_rules)
        co.scan('001')
        co.scan('002')
        co.scan('001')
        co.scan('003')
        basket = co.basket
        expect(basket).to eq [{'code' => '001', 'quantity' => 2}, {'code' => '002', 'quantity' => 1}, {'code' => '003', 'quantity' => 1}]
      end
    end

    context 'check if the discout it will be added at the checkout' do
      it 'returns the total calculated with the discount applied' do
        co = Checkout.new(promotional_rules)
        co.scan("001")
        co.scan("002")
        co.scan("001")
        co.scan("003")
        total = co.total_after_discount
        expect(total).to eq 73.76
      end
    end
  end
end
