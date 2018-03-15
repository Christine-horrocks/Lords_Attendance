require 'app.rb'

describe LordsAttendanceManager do

  it 'confirms if a lord was present' do
    lam = LordsAttendanceManager.new
    lam.clean_packet
    expect(lam.lord_finder('Lord Steel of Aikwood')).to eq('Present')
  end

  it 'confirms if a lord was present' do
    lam = LordsAttendanceManager.new
    lam.clean_packet
    expect(lam.lord_finder('Lord Rogan')).to eq('Present')
  end

  # it 'requests the API' do
  #   expect {
  #     subject.request_api
  #   }.to change {
  #     subject.data_packet
  #   }
  # end
  #
  # it 'cleans the data_packet' do
  #   lam = LordsAttendanceManager.new
  #   lam.clean_packet
  #   expect(lam.data_packet).to eq('foo')
  # end

end
