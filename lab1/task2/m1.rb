# Метод 1 Найти максимальный простой делитель числа.

require "../../utils.rb"

def max_prime_divisor(number)
    (number.downto 2).each {
        |x| return x if number % x == 0 && prime?(x)
    }
    throw "No prime divisors"
end

puts max_prime_divisor(ARGV[0].to_i)