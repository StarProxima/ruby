# Метод 1 Найти максимальный простой делитель числа.

require "../../utils.rb"

if ARGV.length != 1
    puts "Usage: ruby m1.rb <number>"
    exit
end

def max_prime_divisor(number)
    (number.downto 2).each {
        |x| return x if number % x == 0 && prime?(x)
    }
    throw "No prime divisors"
end

puts max_prime_divisor(ARGV[0].to_i)