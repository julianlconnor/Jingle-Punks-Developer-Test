require 'rubygems'
require 'net/http'
require 'ruby-growl'

# Place daemon code here.
g = Growl.new "localhost", "ruby-growl",
              ["http notification"]
loop do
  # Ping google every 5 seconds
  begin
    ping_test = Net::HTTP.new("http://www.google.com").head('/')
    g.notify "http notification", "HTTP Notification",
             "http://www.google.com is up!"
  rescue
      g.notify "http notification", "HTTP Notification",
               "http://www.google.com is down!"
  end
    sleep(5)
end