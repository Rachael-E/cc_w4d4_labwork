require_relative('../db/sql_runner')

class Student

  attr_reader :id, :first_name, :second_name, :house, :age

  def initialize ( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options ['age'].to_i
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS students;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql ="CREATE TABLE students (
      id SERIAL4 primary key,
      first_name VARCHAR(255),
      second_name VARCHAR(255),
      house VARCHAR(255),
      age INT
    );"
    SqlRunner.run(sql)

  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      second_name,
      house,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @second_name, @house, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result

  end

  def self.find( id )
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    student = SqlRunner.run( sql, values )
    result = Student.new( student.first )
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM student_enrolments
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

end
