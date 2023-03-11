require_relative 'student_base.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'

student = Student.new('Фамилия', 'Имя', 'Отчество', id: 0)

print("Student: \n")
print(student)
print("\n\n")

json = student.to_json_str()
studentFromJson = Student.from_json_str(json)

print("Student from json: \n")
print(studentFromJson)
print("\n\n")

hash = student.to_hash()
studentFromHash = Student.from_hash(hash)

print("Student from hash: \n")
print(studentFromHash)
print("\n\n")


studentShortFromStudent = StudentShort.from_student(student)

print("StudentShort from Student: \n")
print(studentShortFromStudent)
print("\n\n")

studentShort = StudentShort.new(0, JSON.generate({"last_name_and_initials": "Фам. И. О."}))

print("StudentShort: \n")
print(studentShort)
print("\n\n")

puts Student.valid_phone?('+7918673844488')
puts Student.valid_profile_name?('mfewef')
puts Student.valid_email?('mfewef@yfa.ru')


# testStudentBase = StudentBase.new()
