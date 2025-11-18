counter = 0
numbers = [1, 7, 3, 4, 5, 2, 6, 0, 9, 8]
while counter < 10
    if numbers[counter] == 0
        counter += 1
        next
    elsif numbers[counter] % 8 == 0
        break
    elsif numbers[counter] % 3 == 0
        puts "Success"
    elsif numbers[counter] % 2 == 0
        puts "Not quite"
    else
        puts "Failure"
    end
    counter += 1
end


def recursive_sum(numbers, index)
    if numbers.size == index
        return 0
    else
        return numbers[index] + recursive_sum(numbers, index + 1)
    end
end

puts recursive_sum(numbers, 0)

