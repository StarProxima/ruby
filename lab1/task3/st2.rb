require "./st1.rb"

if ARGV.length != 2
    puts "Usage: ruby st2.rb <number of method> <file>"
    exit
end

array = File.read(ARGV[1]).split.map(&:to_i)

puts( case ARGV[0].to_i
        when 1
            find_minimum(array)
        when 2
            find_number_of_first_positive_element(array)
        end
    )