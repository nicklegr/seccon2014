require 'pp'

d = File.read("forensic100_/Export2/381-key.txt")

loop do
  d = d.encode("UTF-8", "UTF-8", :invalid => :replace, :undef => :replace, :replace => '?')
  d[/key(\d+)\.txt/]
  num = $1
  puts num

  Dir.glob("forensic100_/Export2/*") do |f|
    # puts f
    # if f.include?(d)
    if f.match(/\d+?-key#{num}/)
    # if f.match(/\d+?-#{num}/)
      puts f
      d = File.read(f)
    end
  end
end
