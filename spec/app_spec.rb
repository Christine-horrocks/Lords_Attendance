require 'app.rb'

describe LordsAttendanceManager do

  it 'confirms if a lord was present' do
    expect(subject.lord_finder('Lord Steel of Aikwood')).to eq('present')
  end

  it 'requests the API' do
    expect {
      subject.request_api
    }.to change {
      subject.data_packet
    }
  end

end
