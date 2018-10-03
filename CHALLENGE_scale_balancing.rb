def scalebalancing(strArr)
balance, available_weights, = strArr
puts "Finding results for: #{strArr}"
@result_first = []
@result_second = []
@result_third = []

def first_test(balance, available_weights)
  available_weights.each do |avail_weight|
    if balance[0]+avail_weight == balance[1]
      @result_first << avail_weight
      break
    elsif balance[1]+avail_weight == balance[0]
      @result_first << avail_weight
      break
    end
  end
end

def second_test(balance, available_weights)
  available_weights.each do |avail_weight|
    available_weights.each do |avail_weight_faster|
      if available_weights.count(avail_weight) == 1 && avail_weight == avail_weight_faster
        next
      else
        if balance[0]+avail_weight == balance[1]+avail_weight_faster && @result_second.length <= 1
            @result_second << avail_weight_faster
        elsif balance[0]+avail_weight_faster == balance[1]+avail_weight && @result_second.length <= 1
            @result_second << avail_weight_faster
        end
      end
    end
  end
end

def third_test(balance, available_weights)
  available_weights.each do |avail_weight|
    available_weights.each do |avail_weight_faster|
      if available_weights.count(avail_weight) == 1 && avail_weight == avail_weight_faster
        next
      else
        if balance[0]+avail_weight+avail_weight_faster == balance[1] && @result_third.length <= 1
          @result_third << avail_weight << avail_weight_faster
        elsif balance[1]+avail_weight+avail_weight_faster == balance[0] && @result_third.length <= 1
          @result_third << avail_weight << avail_weight_faster
        end
      end
    end
  end
end

first_test(balance, available_weights)
second_test(balance, available_weights)
third_test(balance, available_weights)
if @result_first.length == 1
  puts @result_first.uniq.sort.join(", ")
elsif @result_second.length == 2
  puts @result_second.sort.join(", ")
else
  puts @result_third.sort.join(", ")
end


end

scalebalancing([[3, 4], [1, 7, 6, 1, 7, 7]])
scalebalancing([[13, 4], [1, 2, 3, 6, 14]])
scalebalancing([[5, 3], [1, 3, 4, 1000, 2000]])
scalebalancing([[4, 8], [2, 2, 3, 1000, 2000]])
