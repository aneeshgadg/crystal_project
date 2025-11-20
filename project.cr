##Control Flow Example
counter = 0
numbers = [1, 7, 3, 4, 5, 2, 6, 0, 9, 8]
while counter < 10
    if numbers[counter] == 0
        counter += 1
        next #skip the rest of the loop and continue with the next iteration
    elsif numbers[counter] % 8 == 0
        break #exit the loop
    elsif numbers[counter] % 3 == 0
        puts "Success"
    elsif numbers[counter] % 2 == 0
        puts "Not quite"
    else
        puts "Failure"
    end
    counter += 1
end

##Recursive Example to show functional elements of the language
def recursive_sum(numbers, index)
    if numbers.size == index #base case
        return 0
    else
        return numbers[index] + recursive_sum(numbers, index + 1) #recursive case
    end
end

puts recursive_sum(numbers, 0)


##Feature of Crystal: Null Safety
##In Crystal, we can have nilable or union types 
name : String? = nil # String or nil, same thing as String | nil

#Unlike JS/Ruby, we want to avoid errors like undefined method on nil values 
name = "John"
puts name.try &.upcase #similar to Kotlin's let operator

name = nil
puts name.try &.upcase 