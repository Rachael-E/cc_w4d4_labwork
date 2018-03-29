require_relative('../models/student')

Student.drop
Student.create

student1 = Student.new({
  "first_name" => "Rachael",
  "second_name" => "Ellen",
  "house" => "Gryffindor",
  "age" => "31"
})

student2 = Student.new({
  "first_name" => "Marta",
  "second_name" => "Beveridge",
  "house" => "Ravenclaw",
  "age" => 24
})

student1.save()
student2.save()
p Student.find(1)
