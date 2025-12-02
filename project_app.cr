#!/usr/bin/env crystal

def run_strings_demo
  puts "=== String Syntax & Operations ==="
  puts "----------------------------------"
  
    # Printing a literal
    puts "Hello World!"

    # Variable assignment, automatic type inference as String
    message = "Hello Penny!"

    # Printing name of expression/variable/type, not just value
    p! message, typeof(message)

    # Variable reassignment
    message = "Hello Sheldon!"
    p! message, typeof(message)

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
end

def run_numerics_demo
  puts "=== Numerics & Comparisons ==="
  puts "------------------------------"
  p! 1 == 1, # equality check
     1 == 2,
     2 > 1,  # comparison operations
     0 >= 1

  # Similar to compare method from Comparator Interface in Java
  p! 1 <=> 1
  p! 1 + 1,  # addition
     2 * 3,  # multiplication
     2 ** 4, # exponentiation
     2 // 3, # floor division
     3 % 2,  # modulus
     -1,     # negation
     4 + 5 * 2,    # Parenthesis used for precedence
     (4 + 5) * 2,
     -5.abs,       # absolute value
     4.3.round     # round to nearest integer
end

def run_control_flow_demo
  puts "=== Control Flow & Recursion ==="
  puts "--------------------------------"
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

    ##Sum of numbers in the array
    sum = 0
    numbers.each do |number| #each is a method that iterates over the array, this iterator is used instead of a for loop
        sum += number
    end
    puts "Sum of numbers: #{sum}"

  run_null_safety_demo
end


def run_null_safety_demo
  puts "\n--- Null Safety ---"
  # In Crystal, we can have nilable or union types
  name : String? = nil # String or nil, same thing as String | nil
  # Unlike JS/Ruby, we want to avoid errors like undefined method on nil values
  name = "John"
  puts name.try &.upcase # similar to Kotlin's let operator
  name = nil
  puts name.try &.upcase
end

## Abstract classes
abstract class Animal
  def speak
    raise "Subclasses must implement speak" ##Raise an error if the method is not implemented in the subclass
  end
end 

## Inheritance
class Dog < Animal
  def speak
    puts "Woof!"
  end
end

## Inheritance
class Person < Animal
  def initialize(name : String, age : Int32, height : Int32) # Constructor with explicit typing
    @name = name
    @age = age
    @height = height
    @human = true
  end

  def name
    @name
  end

  def age
    @age
  end

  def height
    @height
  end

  def human
    @human
  end

  def birthday
    @age += 1
  end

  def speak
    "Hello, my name is #{@name}"
  end
end

## Inheritance
class Student < Person
  def initialize(name : String, age : Int32, height : Int32, student_id : Int32)
    super(name, age, height)
    @student_id = student_id
  end

  def student_id
    @student_id
  end

  def speak
    "#{super} and my student ID is #{@student_id}"
  end

end


def run_typing_demo
  puts "=== Static Typing & Classes ==="
  puts "-------------------------------"
  person = Person.new("John", 25, 75)
  person.birthday
  puts person.name, person.age, person.height, person.human
  student = Student.new("John", 25, 75, 12345)
  puts student.name, student.age, student.height, student.human, student.student_id
  ##Compare the speak method of the person and student classes
  puts person.speak
  puts student.speak
end

def run_parallelism_demo
  puts "=== Parallelism ==="
  puts "-------------------"
  channel = Channel(String).new
  puts "Starting parallel tasks..."
  10.times do |i|
    spawn do
      sleep (rand * 0.4).seconds
      channel.send("Task #{i} completed")
    end
  end

  10.times do
    message = channel.receive
    puts message
  end
  puts "All tasks completed."
end

DEMOS = {
  "1" => {label: "String syntax & operations", action: -> { run_strings_demo }},
  "2" => {label: "Numerics & comparisons", action: -> { run_numerics_demo }},
  "3" => {label: "Control flow & null safety", action: -> { run_control_flow_demo }},
  "4" => {label: "Static typing & classes", action: -> { run_typing_demo }},
  "5" => {label: "Parallelism", action: -> { run_parallelism_demo }},
  "q" => {label: "Quit", action: -> { exit 0 }},
}

loop do
  # Display menu options except quit
  puts "\nChoose a demo to run:"
  DEMOS.each do |key, info|
    next if key == "q"
    puts "#{key}. #{info[:label]}"
  end
  puts "q. Quit"
  print "> "

  # Read user selection; nil (Ctrl+D) exits loop
  choice = STDIN.gets
  choice = choice.try &.strip
  break unless choice

  # Execute matching demo or warn about invalid option
  if demo = DEMOS[choice]
    puts
    demo[:action].call
  else
    puts "Unknown option: #{choice}"
  end
end

puts "Goodbye!"

