# 1.57 Для введенного списка найти количество таких элементов, которые больше, чем сумма всех предыдущих.

def count_greater_than_sum(arr)
    count = 0
    arr.reduce(0) { |s, x| count += 1 if x > s; s + x }
    count

    # or
    # arr.each_with_index.count { |x, i| x > arr[0...i].sum }
end

puts count_greater_than_sum([1, 2, 3])