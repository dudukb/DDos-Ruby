require "http"
require "thread"

domain  = 'https://example.com'
count   = 100
type    = "GET"

def attack(domain,type)
if type == "POST"
code = HTTP.post(domain).code
elsif type == "GET"
code = HTTP.get(domain).code
else
abort('not supported attack type')
end
puts "http code #{code}"
end


start = 0
stop  = count

threads = ("#{start}".."#{stop}").map do |int|  
  Thread.new do
    attack(domain,type) 
  end
end

threads.each(&:join)
