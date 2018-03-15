require 'net/http'
require 'json'
require 'Hashie'

class LordsAttendanceManager

  def initialize
    @data_packet = {}
  end

  def lord_finder(name)
    clean_packet
    @data_packet.extend Hashie::Extensions::DeepFind
    attendee_names = @data_packet.deep_find_all("fullName")
    if attendee_names.find { |h| h.value?(name) } == {"_value"=>name}
      'Present'
    else
     'Not Present'
    end
  end

  private

  def clean_packet
    @data_packet = JSON.parse(request_api).fetch("result")
  end

  def request_api
    uri = URI("http://lda.data.parliament.uk/lordsattendances/725650.json")
    (Net::HTTP.get(uri))
  end

end
