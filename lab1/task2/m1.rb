# Метод 1 Найти максимальный простой делитель числа.

def prime?(number)
    (2.upto Math.sqrt(number)).each {
        |x| return false if number % x == 0
    }
    true
end

def max_prime_divisor(number)
    (number.downto 2).each {
        |x| return x if number % x == 0 && prime?(x)
    }
    throw "No prime divisors"
end

puts max_prime_divisor(ARGV[0].to_i)