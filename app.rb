require './lib/order_collection.rb'


orders = Orders::OrderCollection.new('заявка.csv')

puts orders

