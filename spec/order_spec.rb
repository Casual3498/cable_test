require './lib/order.rb'

describe Orders::Order do 
  let(:order) { Orders::Order.new(nil, raw_name: 'Провод ПЭТВ-2 0,950 ТУ 16-705-110-79 6Кв зелёный abcehkmoptuvxy', unit: 'кг', qty: 50)}

  it '#raw_name' do
    expect(order.raw_name).to eq('Провод ПЭТВ-2 0,950 ТУ 16-705-110-79 6Кв зелёный abcehkmoptuvxy')
  end

  it '#unit' do
    expect(order.unit).to eq('кг')
  end  

  it '#qty' do
    expect(order.qty).to eq(50)
  end 

  it '#up_cyr_name' do
    expect(order.up_cyr_name).to eq('ПРОВОД ПЭТВ-2 0,950 ТУ 16-705-110-79 6КВ ЗЕЛЁНЫЙ АВСЕНКМОРТИВХУ')
  end

end