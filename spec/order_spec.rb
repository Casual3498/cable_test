require './lib/order.rb'

describe Orders::Order do 
  let(:order) { Orders::Order.new(nil, raw_name: 'Провод ПЭТВ-2 0,950 ТУ 16-705-110-79 6Кв красно-коричневый', unit: 'кг', qty: 50)}
  let(:check_lat) { Orders::Order.new(nil, raw_name: 'abcehkmoptuvxy', unit: '', qty: 0)}


  it '#raw_name' do
    expect(order.raw_name).to eq('Провод ПЭТВ-2 0,950 ТУ 16-705-110-79 6Кв красно-коричневый')
  end

  it '#unit' do
    expect(order.unit).to eq('кг')
  end  

  it '#qty' do
    expect(order.qty).to eq(50)
  end

  it '#up_cyr_name' do
    expect(order.up_cyr_name).to eq('ПРОВОД ПЭТВ-2 0,950 ТУ 16-705-110-79 6КВ КРАСНО-КОРИЧНЕВЫЙ')
  end

  it '#up_cyr_name latin_values' do
    expect(check_lat.up_cyr_name).to eq('АВСЕНКМОРТИВХУ')
  end

  it '#voltage' do
    expect(order.voltage).to eq('6КВ')
  end

  it '#color' do
    expect(order.color).to eq('КРАСНО-КОРИЧНЕВЫЙ')
  end

  it '#standard' do
    expect(order.standard).to eq('ТУ 16-705-110-79')
  end


end