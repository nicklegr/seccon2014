def reverse_byte(x)
  ret = 0
  mask = 0x80

  for i in 0..7
    b = (x & mask) != 0 ? 1 : 0
    ret |= b << i
    mask >>= 1
  end

  ret
end

d = File.binread("Reverseit")
o = []

# for i in 0..255
  d.each_byte do |e|
    # puts e.to_i
    # o << ((e.to_i) ^ 0xff)
    # o << reverse_byte(e.to_i)
    o << e.to_i
  end

  # 256.times do
  #   o << 0xcc
  # end
# end

o.reverse!

File.binwrite("out", o.pack('C*'))
