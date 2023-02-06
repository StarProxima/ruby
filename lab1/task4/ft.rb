require "./st1.rb"
require "./st2.rb"
require "./st3.rb"
require "./st4.rb"
require "./st5.rb"


puts 'Введите номер метода:'

mi = gets.chomp.to_i

puts 'Введите массив:'

arr = gets.chomp.split.map(&:to_i)

puts( case mi
        when 1
            before_last_min(arr)
        when 2
            after_first_max(arr)
        when 3
            alternating_signs?(arr)
        when 4
            puts 'Введите интервал:'
            interval = gets.chomp.split.map(&:to_i)
            sum_in_interval(arr, interval.first, interval.last)
        when 5
            count_greater_than_sum(arr)
        end
    )