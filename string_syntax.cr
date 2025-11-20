# Printing a literal
puts "Hello World!"

# Variable assignment
message = "Hello Penny!"

# Printing name of expression/variable, not just value
p! message

# Variable reassignment
message = "Hello Sheldon!"

p! message

# Variable reassignment with different type
message = 73

# Printing name of expression/variable and type
p! message, typeof(message)


message2 = "Hello World! Greetings from Crystal."

## String operations
puts "normal: #{message2}"
puts "upcased: #{message2.upcase}"
puts "downcased: #{message2.downcase}"

## Useful String-based methods
message2 = "Hello World! Greetings from Crystal."
p! message2.size,
   message2.empty?

## Testing for equality of Strings
message3 = "Hello World!"
p! message3 == "Hello World"