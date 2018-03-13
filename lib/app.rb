require 'net/http'
require 'json'

class LordsAttendanceManager

  attr_reader :data_packet

  def initialize
    @data_packet
  end

  def request_api
    uri = URI("http://lda.data.parliament.uk/lordsattendances/725650.json")
    (Net::HTTP.get(uri))
  end

  def clean_packet
    @data_packet = JSON.parse(request_api).fetch("result")
  end



  def lord_finder(name)
    'present'
  end

end
