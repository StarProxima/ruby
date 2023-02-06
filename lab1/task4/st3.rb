# 1.33 Дан целочисленный массив. Проверить, чередуются ли в нем положительные и отрицательные числа.


def alternating_signs?(arr)
    arr.each_cons(2).all? { |a, b| a * b < 0 }

    # or
    # arr.each_with_index {
    #     |x, i|
    #     if x > 0 && !arr[i + 1].nil? && arr[i + 1] > 0 || 
    #         x < 0 && !arr[i + 1].nil? && arr[i + 1] < 0
    #         return false
    #     end
    # } 
    # true
end

# puts alternating_signs?([1, -2, -3])