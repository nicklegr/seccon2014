ARGF.each_line do |e|
  puts e.unpack('u')
end
