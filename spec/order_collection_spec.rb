require './lib/order_collection.rb'

describe Orders::OrderCollection do
  let(:order_collection) { Orders::OrderCollection.new('заявка.csv') }

  it '#count' do
    expect(order_collection.count).to eq(5)
  end


end