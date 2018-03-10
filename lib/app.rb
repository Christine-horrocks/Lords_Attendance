require 'net/http'
require 'json'

class LordsAttendanceManager

  def request_api
    uri = URI("http://lda.data.parliament.uk/lordsattendances.json?_view=Lords+Attendance+Records&_pageSize=10&_page=0")
    (Net::HTTP.get(uri))
  end

  def lord_finder(name)
    'present'
  end

end
