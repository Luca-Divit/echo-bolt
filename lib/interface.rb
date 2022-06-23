# This require relative is to call the checkout file
require_relative './checkout'

# Items to pass as an argument to the checkout
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

# We initialize a new checkout with the promotional rules
co = Checkout.new(promotional_rules)

# we show what items and possible promotions on quantity we have
puts 'Items in stock:'
promotional_rules['items'].each do |key, value|
  puts ' '
  puts "Code: #{key}"
  puts "Name: #{value['name']}"
  value['price'].each do |k, v|
    puts "buy #{k} #{value['name']} for #{v}"
  end
end

# We ask to select items to add to the basket
puts ' '
puts 'Select an item to scan'

item = gets.chomp
co.scan(item)

# We keep asking until they press enter with an empty string
while item != ''
  puts 'Select an item to scan or press enter to proceed to the checkout'
  item = gets.chomp
  co.scan(item) if item != ''
end

# Creating an empty basket and pushing any single item in it
basket = []
co.basket.each do |item|
  item['quantity'].times { basket << item['code'] }
end

# Displaying total before discount, then if the basket is empty
# we either return the empty basket string or the items and quantity
# at last we display the final price in case the 10% has been added
puts "total price before discount: £#{co.total}"
puts "basket: #{basket.length.zero? ? 'basket is empty' : basket.join(', ')}"
puts "Total price is: £#{total_after_discount}"
