# 1.45 Дан целочисленный массив и интервал a..b. Необходимо найти сумму элементов, значение которых попадает в этот интервал.

def sum_in_range(arr, range)
    arr[range].reduce(0) { |s, x| s + x }
end

def sum_in_interval(arr, a, b)
    arr[a..b].reduce(0) { |s, x| s + x }
end


# puts sum_in_range([1, 2, 3, 4], 1..2)
# puts sum_in_interval([1, 2, 3, 4], 1, 2)
