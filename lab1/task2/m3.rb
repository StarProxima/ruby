# Метод 3 Найти НОД максимального нечетного непростого делителя числа и
# прозведения цифр данного числа.

require "../../utils.rb"

def multiply_digits(number)
    number.digits.reduce(1) { |m, d| m * d }
end

def max_odd_non_prime_divisor(number)
    (number.downto 2).each { |x| return x if number % x == 0 && x.odd? && !prime?(x) }
    throw "No odd non-prime divisors"
end

def gcd(a, b)
    return a if b == 0
    gcd(b, a % b)
end

puts gcd(max_odd_non_prime_divisor(ARGV[0].to_i), multiply_digits(ARGV[0].to_i))