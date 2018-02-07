require 'net/http'
require 'json'
​
def itunes_api_response
  # encode URI using the URI constant
  uri = URI("https://itunes.apple.com/search?term=michael+jackson&entity=song")
  # tell Net::HTTP to GET the URI
  Net::HTTP.get(uri) # => String
end
​
# if we require this file in an IRB session, then
# assign itunes_api_response to a variable, we
# can interact with the response
​
response = itunes_api_response
puts response
