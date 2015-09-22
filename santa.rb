#!/usr/bin/env ruby

santa = Array.new
names = Array.new

if (!ARGV.empty?) 
    File.open(ARGV[0]) do |f|
        f.each_line do |line|
            names << line.chomp
        end
    end
else
    puts "USAGE: #{$0} filename (one name per line)"
    puts "\nSince you didn't give me a filename, I'll just use my own list"
    names = ["Mark", "Rick", "Steve", "Sue", "Tom", "Chris", "Maxwell"]
end

i = 0

while (i < names.length) do
    rnd = rand(names.length)
    while ((rnd == i) || (santa.include? names[rnd])) do
        #puts "#{rnd} - again"
        rnd = rand(names.length)
    end
    santa[i] = "#{names[rnd]}"
    i += 1
end

i = 0

puts "Person - Secret Santa"
while (i < names.length) do
    puts "#{names[i]} - #{santa[i]}"
    i += 1
end

