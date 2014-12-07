# nc number.quals.seccon.jp 31337

require 'socket'
require 'pp'

sock = TCPSocket.open("number.quals.seccon.jp", 31337)

loop do
  prompt = ""

  while !prompt.include?("?")
    c = sock.getc
    break unless c
    prompt += c
  end
  pp prompt

  nums = prompt.gsub(/\n.+/, "")
  nums = nums.split.map{ |e| e.to_i }
  pp nums
  break if nums.size == 0

  if prompt.include?("maximum")
    ans = nums.max.to_s + "\n"
    pp ans
    sock.puts(ans)
  elsif prompt.include?("minimum")
    ans = nums.min.to_s + "\n"
    sock.puts(ans)
  elsif prompt.include?("Wrong")
    raise
  end
end

# maximum minimum

__END__

require "open3"
stdin, stdout = *Open3.popen2('nc number.quals.seccon.jp 31337')

loop do
  nums = stdout.readline
  prompt = stdout.readline

  STDERR.puts nums, prompt
  stdin.puts(nums.split.map{ |e| e.to_i }.min)
end
