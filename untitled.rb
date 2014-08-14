curl -X POST --data-urlencode 'payload={"channel": "#error_room", "error": "error", "text": "テストだぴょん", "icon_emoji": ":ghost:"}' https://thn.slack.com/services/hooks/incoming-webhook?token=iUzsHPrz26EZen9quIEfsPVY

s = '{"channel": "#error_room", "error": "error", "text": "テストだぴょん", "icon_emoji": ":ghost:"}'
hash = JSON.parse(s)

hash = {
  "channel"=>"#error_room",
  "error"=>"error",
  "text"=>s,
  "icon_emoji"=>":ghost:"
}

url = "https://thn.slack.com/services/hooks/incoming-webhook?token=iUzsHPrz26EZen9quIEfsPVY"

require 'net/http'
require 'json'

response = nil

request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})
request.body = hash.to_json


def http_client
end
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

http.set_debug_output $stderr

http.start do |h|
  response = h.request(request)
end
