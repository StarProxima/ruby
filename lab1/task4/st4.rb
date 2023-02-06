# 1.45 Дан целочисленный массив и интервал a..b. Необходимо найти сумму элементов, значение которых попадает в этот интервал.


def sum_in_interval(arr, a, b)
    arr.reduce(0) { 
        |s, x| 
        if x >= a && x <= b then 
            s + x 
        else 
            s 
        end
    }
end


puts sum_in_interval([1, 2, 3, 4], 1, 2)
