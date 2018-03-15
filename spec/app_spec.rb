require 'app.rb'

describe LordsAttendanceManager do

  it 'confirms if a lord was present' do
    expect(subject.lord_finder('Lord Steel of Aikwood')).to eq('Present')
  end

  it 'confirms if a lord was present' do
    expect(subject.lord_finder('Lord Rogan')).to eq('Present')
  end

end
