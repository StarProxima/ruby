# Метод 2 Найти произведение цифр числа, не делящихся на 5

if ARGV.length != 1
    puts "Usage: ruby m2.rb <number>"
    exit
end

def multiply_digits_not_divisible_by_5(number)
    number.digits.reduce(1) {
        |m, d| if d % 5 != 0 then m * d else m end
    }
end

puts multiply_digits_not_divisible_by_5(ARGV[0].to_i)