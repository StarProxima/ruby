# Метод 2 Найти произведение цифр числа, не делящихся на 5

def multiply_digits_not_divisible_by_5(number)
    number.digits.reduce(1) {
        |x, y| if y % 5 != 0 then x * y else x end
    }
end

puts multiply_digits_not_divisible_by_5(ARGV[0].to_i)