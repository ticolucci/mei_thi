desc "Pings PING_URL to keep a dyno alive"
task :dyno_ping do
  require "net/http"

  def time_to_ping
    Time.zone.now < Time.parse('00:30') || Time.zone.now > Time.parze('06:30')
  end

  if ENV['PING_URL'] && time_to_ping
    uri = URI(ENV['PING_URL'])
    Net::HTTP.get_response(uri)
  end
end
