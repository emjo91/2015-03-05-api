require 'pry'
require 'sqlite3'
# DATABASE = SQLite3::Database.new("students.db")
# DATABASE.results_as_hash = true

class Student
  attr_reader :id
  
  attr_accessor :age, :name, :github
  
  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @age = options["age"]
    @github = options["github"]
  end
  
  def change_age
    @age = 1000
  end
  
  def can_drink?
    age >= 200
  end
  
  def ultra_wise?
    age >= 1000
  end
  
  def github_link
    "http://github.com/#{github}"
  end
  
  def insert
    DATABASE.execute("INSERT INTO students (name, age, github) VALUES ('#{@name}', #{@age}, '#{@github}')")
    @id = DATABASE.last_insert_row_id
  end
  
  def update
    DATABASE.execute("UPDATE students SET age = #{@age} WHERE id = #{@id}")
  end
  
  def self.delete(id)
    DATABASE.execute("DELETE FROM students where id = #{id}")
  end
  
  # Public: Get a list of all students from the database.
  #
  # Returns an Array of Student objects.
  def self.all
    results = DATABASE.execute("SELECT * FROM students")
    
    results.map { |row_hash| self.new(row_hash) }
  end
  
  # Public: Get a single student from the database.
  #
  # s_id - Integer
  #
  # Returns a Student object.
  def self.find(s_id)
    result = DATABASE.execute("SELECT * FROM students WHERE id = #{s_id}")[0]
    
    self.new(result)
  end
  
  # Returns the object as a Hash.
  def to_hash
    {
      id: id,
      name: name,
      age: age,
      github: github
    }
  end
end