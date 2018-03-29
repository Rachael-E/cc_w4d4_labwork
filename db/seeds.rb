require_relative('../models/student')
require_relative('../models/house')


Student.drop
Student.create

house1 = House.new({
  "name" => "Gryffindor"
  })
house2 = House.new({
  "name" => "Ravenclaw"
  })
house3 = House.new({
  "name" => "Hufflepuff"
  })
house4 = House.new({
  "name" => "Slytherin"
  })

house1.save
house2.save
house3.save
house4.save


student1 = Student.new({
  "first_name" => "Rachael",
  "second_name" => "Ellen",
  "house_id" => house1.id,
  "age" => "31"
})

student2 = Student.new({
  "first_name" => "Marta",
  "second_name" => "Beveridge",
  "house_id" => house2.id,
  "age" => 24
})


student1.save()
student2.save()
p Student.find(1)
