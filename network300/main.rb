# nc number.quals.seccon.jp 31337

require 'socket'
require 'pp'

sock = TCPSocket.open("ftpsv.quals.seccon.jp", 21)

sock.puts "USER anonymous"
sock.puts "PASS hoge"

loop do
  sock.gets
end
