class Person
    def initialize(name : String, age : Int32, height : Int32) #Constructor with explicit typing
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

  end

  person = Person.new("John", 25, 75)
  person.birthday
  puts person.name, person.age, person.height, person.human



 
